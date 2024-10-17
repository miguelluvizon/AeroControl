import psutil
import time
import csv
import datetime as dt
import boto3
import os
import json
import mysql.connector

# Para esse import, primeiro foi feito um "py -m pip install jira" para instalar a biblioteca
from jira import JIRA

# Estabelecendo conexão ao BD
mydb = mysql.connector.connect(
    user='root', 
    password='Mig01qn89!', 
    host='localhost',
    database='teste',
    port = "3306"
)

cursor = mydb.cursor()

# Aqui são as config do jira
jira_url = "https://sptech-team-ryhhthev.atlassian.net/" #url do jira
email = "miguel.luvizon@sptech.school" # seu email
chave_projeto = "KAN"  # Chave do projeto Jira
api_token = "xxxx" #Passo a passo para gerar o token:
# Na tela inicial do jira, você vai no canto superior direito, clica no seu perfil e acessa "gerenciar conta",
# Depois vá em "segurança" e selecione a opção "criar e gerenciar tokens de API", pronto, agora só criar o Token :)

cpu_limite = 1 # Esse limite ta estabelecido como 1 para testes, justamente para disparar o alerta (pode ser alterado)  
usoRAM_limite = 1
porcentagemRAM_limite = 1


  
# Aqui é feita a autenticação
def conectar(): # função de conexão com o jira
    jira = JIRA(basic_auth=(email,api_token),server=jira_url)
    return jira

def cpuAlerta(jira, porcentagemCPU):
    info_alerta_cpu = {
    'project': {'key': chave_projeto},  # Aqui inserimos a chave do projeto Jira
    'summary': f'Alerta: CPU acima do limite ({porcentagemCPU}%)',  # Definimos o titulo do alerta
    'description': f'O uso da CPU ultrapassou o limite de {cpu_limite}%. Atualmente está em {porcentagemCPU}%.',  # Aqui a descrição do alerta
    'issuetype': {'name': 'Task'},  # E o tipo de alerta
    }

    # Criando o alerta
    novo_alerta_cpu = jira.create_issue(fields=info_alerta_cpu)
    # Aqui apenas exibe o link do alerta
    print(f'Alerta criado: {jira_url}/browse/{novo_alerta_cpu.key}')

def porcentagemRamAlerta(jira, porcentagemRAM):
    info_alerta_porcentagemRam = {
    'project': {'key': chave_projeto},  # Aqui inserimos a chave do projeto Jira
    'summary': f'Alerta: Porcentagem da RAM acima do limite ({porcentagemRAM}%)',  # Definimos o titulo do alerta
    'description': f'O uso da memoria RAM em porcentagem ultrapassou o limite de {porcentagemRAM_limite}%. Atualmente está em {porcentagemRAM}%.',  # Aqui a descrição do alerta
    'issuetype': {'name': 'Task'},  # E o tipo de alerta
    }

    # Criando o alerta
    novo_alerta_porcentagemRam = jira.create_issue(fields=info_alerta_porcentagemRam)
    # Aqui apenas exibe o link do alerta
    print(f'Alerta criado: {jira_url}/browse/{novo_alerta_porcentagemRam.key}')

bucket_nome = 's3-raw-aerocontrol'
s3 = boto3.client('s3')

def criar_json_se_nao_existir(nome_arquivo,dados_iniciais):
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
            writer.writerow(['Porcentagem CPU', 'Uso RAM (Bytes)', 'Porcentagem RAM'])

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

    # Conexão com Jira
    jira = conectar()

    while True:
        passou += 1

        ram = "RAM"
        cpu = "CPU"
        porcentagemCPU = psutil.cpu_percent()
        usoRAM = round(psutil.virtual_memory().used)
        porcentagemRAM = psutil.virtual_memory().percent

        data = {
            'cpu':porcentagemCPU,
            'memoriaByte':usoRAM,
            'memoriaPorcent':porcentagemRAM,
            'timestamp':dt.datetime.now().isoformat()
        }

        dados = [porcentagemCPU, usoRAM, porcentagemRAM]
        print(f"Porcentagem de uso da CPU: {porcentagemCPU}%\nUso de memória RAM: {usoRAM} Bytes\nPorcentagem RAM: {porcentagemRAM}%\nCiclo: {passou}")

        # se a porcentagem da cpu passar do limite, um alerta é enviado para o jira e armazenado no banco
        if porcentagemCPU > cpu_limite:
            print(f"Alerta: Uso da CPU {porcentagemCPU}% ultrapassou o limite!")
            cpuAlerta(jira,porcentagemCPU)
            sql = "INSERT INTO alerta VALUES (default, %s, default)"
            val = (cpu,)
            cursor.execute(sql,val)
            mydb.commit()

        # se a porcentagem da cpu passar do limite, um alerta é enviado para o jira e armazenado no banco
        if porcentagemRAM > porcentagemRAM_limite:
            print(f"Alerta: Uso da memoria Ram em porcentagem {porcentagemRAM}% ultrapassou o limite!")
            porcentagemRamAlerta(jira,porcentagemRAM)
            sql = "INSERT INTO alerta VALUES (default, %s, default)"
            val = (ram,)
            cursor.execute(sql,val)
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

            try:
                s3.upload_file(nome_arquivo, bucket_nome, f'{data_atual}.csv')
                s3.upload_file(nome_arquivo_json, bucket_nome, f'{nome_arquivo_json}')
                print(f"Arquivo {nome_arquivo} enviado para o bucket {bucket_nome}.")
            except Exception as e:
                print(f"Erro ao enviar o arquivo para o S3: {str(e)}")

        if total_dados >= max_dados:
            total_dados = 0

            data_atual = dt.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
            nome_arquivo = f'./raw_data_{data_atual}.csv'
            criar_csv_se_nao_existir(nome_arquivo)
            print(f"Novo arquivo CSV {nome_arquivo} criado após atingir 5.000 dados.")

        time.sleep(tempo)

monitorar()
