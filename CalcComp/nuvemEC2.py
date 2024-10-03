import psutil
import time
import csv
import datetime as dt
import boto3
import os

bucket_nome = 's3-raw-aerocontrol'
s3 = boto3.client('s3')

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
    nome_arquivo = f'./raw_data_{data_atual}.csv'
    criar_csv_se_nao_existir(nome_arquivo)

    while True:
        passou += 1

        porcentagemCPU = psutil.cpu_percent()
        usoRAM = round(psutil.virtual_memory().used)
        porcentagemRAM = psutil.virtual_memory().percent

        dados = [porcentagemCPU, usoRAM, porcentagemRAM]
        print(f"Porcentagem de uso da CPU: {porcentagemCPU}%\nUso de memória RAM: {usoRAM} Bytes\nPorcentagem RAM: {porcentagemRAM}%\nCiclo: {passou}")

        with open(nome_arquivo, 'a', newline='') as csvfile:
            writer = csv.writer(csvfile, delimiter=',')
            writer.writerow(dados)

        total_dados += 1

        if passou >= dados_por_ciclo:
            passou = 0

            try:
                s3.upload_file(nome_arquivo, bucket_nome, f'raw_data/{data_atual}.csv')
                print(f"Arquivo {nome_arquivo} enviado para o bucket {bucket_nome}.")
            except Exception as e:
                print(f"Erro ao enviar o arquivo para o S3: {str(e)}")

        if total_dados >= max_dados:
            total_dados = 0

            data_atual = dt.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
            nome_arquivo = f'./raw_data_{data_atual}.csv'
            criar_csv_se_nao_existir(nome_arquivo)
            print(f"Novo arquivo CSV {nome_arquivo} criado após atingir 20.000 dados.")

        time.sleep(tempo)

monitorar()
