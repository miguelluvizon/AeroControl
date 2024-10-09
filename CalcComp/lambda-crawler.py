import requests
import json
import datetime
import tempfile
import os
import boto3

def lambda_handler(event, context):

    api_key = "93dc3c89d3e51791104d1c4ff2885e50"
    cities = ["São Paulo", "Salvador"]

    for city in cities:
        url = f"https://api.hgbrasil.com/weather?key={api_key}&city_name={city}&fields=only_results,forecast"
        response = requests.get(url)

        if response.status_code == 200:
            data = response.json()

            # Current weather data
            current_temp = data['results']['temp']
            current_humidity = data['results']['humidity']
            print(f"Temperatura atual em {city}: {current_temp}°C, Umidade: {current_humidity}%")

            # 15-day forecast
            forecast_data = data['results']['forecast']
            print(f"\nPrevisão para os próximos 15 dias em {city}:")
            for day_data in forecast_data:
                date = day_data['date']
                max_temp = day_data['max']
                min_temp = day_data['min']
                description = day_data['description']
                print(f"  Data: {date}, Máxima: {max_temp}°C, Mínima: {min_temp}°C, Condição: {description}")

            print("-" * 20)  # Separator between cities
        else:
            print(f"Erro ao obter os dados para {city}. Código de status:", response.status_code)  

    try:

        resultado = requests.get(url)

        # Verifica se a requisição foi bem-sucedida

        resultado.raise_for_status()

        # Decodifica o JSON

        dados = resultado.json()

        transacoes = dados['results']

        nome_arquivo = os.path.join(tempfile.gettempdir(), 'clima.json')

        with open(nome_arquivo, mode='wt') as f:

            json.dump(transacoes, f)

        s3 = boto3.client('s3')

        s3.upload_file(

            Filename=nome_arquivo,

            Bucket='s3-raw-aerocontrol',

            Key='clima.json'

        )

        

        return transacoes

    except requests.exceptions.RequestException as e:

        print(f"Erro na requisição: {e}")

        return None
    
    except json.JSONDecodeError as e:

        print(f"Erro ao decodificar JSON: {e}")

        print(f"Resposta completa da API: {resultado.text}")

        return None

 

print(lambda_handler(None, None))