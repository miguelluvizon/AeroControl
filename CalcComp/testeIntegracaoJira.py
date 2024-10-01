import psutil
import time

# Para esse import, primeiro foi feito um "py -m pip install jira" para instalar a biblioteca
from jira import JIRA

# Aqui são as config do jira
jira_url = "https://sptech-team-ryhhthev.atlassian.net/" #url do jira
email = "miguel.luvizon@sptech.school" # seu email
chave_projeto = "KAN"  # Chave do projeto Jira
api_token = "xxxx" #Passo a passo para gerar o token:
# Na tela inicial do jira, você vai no canto superior direito, clica no seu perfil e acessa "gerenciar conta",
# Depois vá em "segurança" e selecione a opção "criar e gerenciar tokens de API", pronto, agora só criar o Token :)

cpu_limite = 1 # Esse limite ta estabelecido como 1 para testes, justamente para disparar o alerta (pode ser alterado)    

# Aqui é feita a autenticação
def conectar(): # função de conexão com o jira
    jira = JIRA(basic_auth=(email,api_token),server=jira_url)
    return jira

def criacao(jira, porcentagemCPU):
    info_alerta = {
    'project': {'key': chave_projeto},  # Aqui inserimos a chave do projeto Jira
    'summary': f'Alerta: CPU acima do limite ({porcentagemCPU}%)',  # Definimos o titulo do alerta
    'description': f'O uso da CPU ultrapassou o limite de {cpu_limite}%. Atualmente está em {porcentagemCPU}%.',  # Aqui a descrição do alerta
    'issuetype': {'name': 'Task'},  # E o tipo de alerta
    }

    # Criando o alerta
    novo_alerta = jira.create_issue(fields=info_alerta)
    # Aqui apenas exibe o link do alerta
    print(f'Alerta criado: {jira_url}/browse/{novo_alerta.key}')

tempo = int(input("Escolha o intervalo de capturas (segundos): \n"))
limiteBoolean = str(input("Deseja impor um limite no número de capturas? (s/n) \n"))
limite = 1

if limiteBoolean == 's':
    limite = int(input("Escolha o número de vezes que o sistema deve capturar. \n"))

# Conexão com Jira
jira = conectar()
    
while (limite > 0):
    porcentagemCPU = (psutil.cpu_percent(interval = 1))
    usoRAM = round(psutil.virtual_memory().used / pow(10, 9), 2)
    porcentagemRAM = psutil.virtual_memory().percent
    print("\nPorcentagem de uso da CPU: {}%\n\nUso de memória RAM: {}GB\nPorcentagem RAM: {}".format      (porcentagemCPU, usoRAM, porcentagemRAM))

    if porcentagemCPU > cpu_limite:
        print(f"Alerta: Uso da CPU {porcentagemCPU}% ultrapassou o limite!")
        criacao(jira,porcentagemCPU)

    if (limiteBoolean == 's'):
        limite = limite - 1
        time.sleep(tempo)
print("Sistema finalizado")



    



    
    
    