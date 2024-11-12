import psutil
import time
import csv
import datetime as dt
import boto3
import os
import json
import mysql.connector
from jira import JIRA

# Configurações do banco de dados
mydb = mysql.connector.connect(
    user='root',
    password='urubu100',
    host='localhost',
    database='aeroControl',
    port="3306"
)
cursor = mydb.cursor()

# Configurações do Jira
jira_url = "https://sptech-team-ryhhthev.atlassian.net/"
email = "miguel.luvizon@sptech.school"
chave_projeto = "KAN"
api_token = "xxxx"

# Limites para alertas
cpu_limite = 1
usoRAM_limite = 1
porcentagemRAM_limite = 1

# Conectar ao Jira
def conectar():
    jira = JIRA(basic_auth=(email, api_token), server=jira_url)
    return jira

def cpuAlerta(jira, porcentagemCPU, maquina):
    info_alerta_cpu = {
        'project': {'key': chave_projeto},
        'summary': f'Alerta: CPU da {maquina} acima do limite ({porcentagemCPU}%)',
        'description': f'O uso da CPU da máquina {maquina} ultrapassou o limite de {cpu_limite}%. Atualmente está em {porcentagemCPU}%.',
        'issuetype': {'name': 'Task'},
    }
    novo_alerta_cpu = jira.create_issue(fields=info_alerta_cpu)
    print(f'Alerta criado: {jira_url}/browse/{novo_alerta_cpu.key}')

def porcentagemRamAlerta(jira, porcentagemRAM, maquina):
    info_alerta_porcentagemRam = {
        'project': {'key': chave_projeto},
        'summary': f'Alerta: RAM da {maquina} acima do limite ({porcentagemRAM}%)',
        'description': f'O uso de RAM da máquina {maquina} ultrapassou o limite de {porcentagemRAM_limite}%. Atualmente está em {porcentagemRAM}%.',
        'issuetype': {'name': 'Task'},
    }
    novo_alerta_porcentagemRam = jira.create_issue(fields=info_alerta_porcentagemRam)
    print(f'Alerta criado: {jira_url}/browse/{novo_alerta_porcentagemRam.key}')

bucket_nome = 's3-raw-aerocontrol'
s3 = boto3.client('s3')

def criar_json_se_nao_existir(nome_arquivo, dados_iniciais):
    if not os.path.exists(nome_arquivo):
        with open(nome_arquivo, 'w') as file:
            json.dump(dados_iniciais, file)

def carregar_json(nome_arquivo):
    if os.path.exists(nome_arquivo):
        with open(nome_arquivo, 'r') as file:
            return json.load(file)
    return []

def criar_csv_se_nao_existir(nome_arquivo):
    if not os.path.exists(nome_arquivo):
        with open(nome_arquivo, 'w', newline='') as csvfile:
            writer = csv.writer(csvfile, delimiter=',')
            writer.writerow(['Máquina', 'Porcentagem CPU', 'Uso RAM (Bytes)', 'Porcentagem RAM'])

tempo = int(input("Você deseja monitorar em quanto tempo (em segundos)? "))
dados_por_ciclo = 10
max_dados = 5000

def monitorar():
    passou = 0
    total_dados = 0

    data_atual = dt.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    nome_arquivo = f'{data_atual}.csv'
    nome_arquivo_json = "dados.json"
    criar_json_se_nao_existir(nome_arquivo_json, [])
    criar_csv_se_nao_existir(nome_arquivo)

    jira = conectar()

    while True:
        passou += 1

        # Nome da máquina (ajuste para o nome ou ID de cada máquina)
        maquina = "PC1000"  # Substitua pelo nome ou ID correto de cada máquina

        porcentagemCPU = psutil.cpu_percent()
        usoRAM = round(psutil.virtual_memory().used)
        porcentagemRAM = psutil.virtual_memory().percent

        data = {
            'maquina': maquina,
            'cpu': porcentagemCPU,
            'memoriaByte': usoRAM,
            'memoriaPorcent': porcentagemRAM,
            'timestamp': dt.datetime.now().isoformat()
        }

        dados = [maquina, porcentagemCPU, usoRAM, porcentagemRAM]
        print(f"{maquina} - CPU: {porcentagemCPU}% | RAM: {usoRAM} Bytes ({porcentagemRAM}%) | Ciclo: {passou}")

        # Gravação em tempo real no banco de dados
        sql = "INSERT INTO monitoramento (maquina, cpu, memoria_byte, memoria_porcent, default) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql, (maquina, porcentagemCPU, usoRAM, porcentagemRAM))
        mydb.commit()

        if porcentagemCPU > cpu_limite:
            cpuAlerta(jira, porcentagemCPU, maquina)
            cursor.execute("INSERT INTO alerta VALUES (default, %s, default)", (f"CPU {maquina}",))
            mydb.commit()

        if porcentagemRAM > porcentagemRAM_limite:
            porcentagemRamAlerta(jira, porcentagemRAM, maquina)
            cursor.execute("INSERT INTO alerta VALUES (default, %s, default)", (f"RAM {maquina}",))
            mydb.commit()

        dados_json = carregar_json(nome_arquivo_json)
        dados_json.append(data)

        with open(nome_arquivo_json, "w", encoding="utf-8") as file:
            json.dump(dados_json, file, indent=4)

        with open(nome_arquivo, 'a', newline='') as csvfile:
            writer = csv.writer(csvfile, delimiter=',')
            writer.writerow(dados)

        total_dados += 1

        if passou >= dados_por_ciclo:
            passou = 0

            timestamp = dt.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
            nome_arquivo_s3 = f'{nome_arquivo}_{timestamp}.csv'
            nome_arquivo_json_s3 = f'{nome_arquivo_json}_{timestamp}.json'

            try:
                s3.upload_file(nome_arquivo, bucket_nome, nome_arquivo_s3)
                s3.upload_file(nome_arquivo_json, bucket_nome, nome_arquivo_json_s3)
                print(f"Arquivos enviados para o S3: {nome_arquivo_s3} e {nome_arquivo_json_s3}")
            except Exception as e:
                print(f"Erro ao enviar o arquivo para o S3: {str(e)}")

        if total_dados >= max_dados:
            total_dados = 0
            data_atual = dt.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
            nome_arquivo = f'./raw_data_{data_atual}.csv'
            criar_csv_se_nao_existir(nome_arquivo)
            print(f"Novo arquivo CSV {nome_arquivo} criado após atingir {max_dados} dados.")

        time.sleep(tempo)

monitorar()
