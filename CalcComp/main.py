import psutil
import time
import mysql.connector
import socket;

# Estabelecendo conexão ao BD
mydb = mysql.connector.connect(user='inserirNuvem', password='aerocontrol', host='10.18.33.33', database='aerocontrol')
cursor = mydb.cursor()

# Obtendo nome da máquina
hostName = socket.gethostname()

# Verificando se a máquina está no sistema (vírgula necessária no val, para ser um tipo lista)
sql = "SELECT idComputador, hostName FROM Computador WHERE hostName = %s"
val = (hostName,)
cursor.execute(sql, val)
resultado = cursor.fetchall();

# Obtendo id da máquina no BD
idMaquina = resultado[0][0]
tempo = 10

if (len(resultado) < 1):
    print("Sua máquina não está no sistema")
else:
    modo = 0;
    limite = 1;
    tempo = int(input("Escolha o intervalo de capturas (segundos): \n"))
    limiteBoolean = str(input("Deseja impor um limite no número de capturas? (s/n) \n"))
    limite = 0;
    if limiteBoolean == 's':
        limite = int(input("Escolha o número de vezes que o sistema deve capturar. \n"))
    inserirBoolean = str(input("Deseja inserir no Banco de Dados? (s/n) \n"))
    inserir = False;    
    if inserirBoolean == 's':
        inserir = True;
    while (limite >=0):
        porcentagemCPU = (psutil.cpu_percent(interval = 1))
        usoRAM = round(psutil.virtual_memory().used / pow(10, 9), 2)
        porcentagemRAM = psutil.virtual_memory().percent
        print("\nPorcentagem de uso da CPU: {}%\n\nUso de memória RAM: {}GB\nPorcentagem RAM: {}".format(porcentagemCPU, usoRAM, porcentagemRAM))
        if (inserir):
            sql = "INSERT INTO DadoComputador VALUES (default, default, %s, %s, %s, %s)"
            val = (porcentagemCPU, porcentagemRAM, usoRAM, idMaquina)
            cursor.execute(sql, val)
            mydb.commit()
            print(cursor.rowcount, "record inserted.")
        if (porcentagemRAM >= 90):
            print("A RAM está com uso excessivo!")
        if (porcentagemCPU >= 70):
            print("A CPU esta com uso excessivo!")
        if (limiteBoolean == 's'):
            limite = limite - 1;
        time.sleep(tempo)
    print("Sistema finalizado")