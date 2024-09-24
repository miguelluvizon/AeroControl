import psutil
import time
import csv
import datetime as dt
import os

bucket_nome = 's3-raw.aerocontrol-lab'

def criar_csv():
    print("teste")

tempo = int(input("Você deseja monitorar em quanto tempo (em segundos)? "))

def monitorar():
    passou = 0

    while True:
        passou += 1

        porcentagemCPU = psutil.cpu_percent()
        usoRAM = round(psutil.virtual_memory().used)
        porcentagemRAM = psutil.virtual_memory().percent

        if passou == 1:
            dado1 = porcentagemCPU, usoRAM, porcentagemRAM
        elif passou == 2:
            dado2 = porcentagemCPU, usoRAM, porcentagemRAM
        elif passou == 3:
            dado3 = porcentagemCPU, usoRAM, porcentagemRAM
        elif passou == 4:
            dado4 = porcentagemCPU, usoRAM, porcentagemRAM
        elif passou == 5:
            dado5 = porcentagemCPU, usoRAM, porcentagemRAM

        print(f"Porcentagem de uso da CPU: {porcentagemCPU}%\nUso de memória RAM: {usoRAM}Bytes\nPorcentagem RAM: {porcentagemRAM}%\n{passou}")

        if passou > 5:
            passou = 0

            data_atual = dt.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
            nome_arquivo = f'./raw_data_{data_atual}.csv'
            
            with open(nome_arquivo, 'w', newline='') as csvfile:
                writer = csv.writer(csvfile, delimiter=',')
                writer.writerow([dado1])
                writer.writerow([dado2])
                writer.writerow([dado3])
                writer.writerow([dado4])    
                writer.writerow([dado5])
            
            print(f"Arquivo CSV {nome_arquivo} criado.")
            
            try:
                comando_s3 = f'aws s3 cp {nome_arquivo} s3://{bucket_nome}/raw_data/{data_atual}.csv'
                os.system(comando_s3)
                print(f"Arquivo {nome_arquivo} enviado para o bucket {bucket_nome}.")
            except Exception as e:
                print(f"Erro ao enviar o arquivo para o S3: {str(e)}")

        time.sleep(tempo)

monitorar()
