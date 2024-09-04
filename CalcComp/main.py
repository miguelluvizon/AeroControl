import psutil
import time
import mysql.connector
import socket;

# Estabelecendo conexão ao BD
mydb = mysql.connector.connect(user='inserirNuvem', password='aerocontrol', host='localhost', database='aerocontrol')
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
    modo = int(input("Bem vindo. Escolha o modo do sistema:\n 1 - teste rápido \n 2 - detecção de picos \n 3 - análise de 15 minutos \n"))
    if modo == 1:
        print("Iniciando sistema. Ele irá mostrar dados 10 vezes durante 50 segundos.")
        tempo = 5;
        limite = 10;
    elif (modo == 2):
        print("Iniciando sistema. Ele irá mostrar dados 10 vezes durante 5 minutos. Se um pico for detectado, será mostrado.")
        tempo = 30;
        limite = 10;
    elif (modo == 3):
        print("Iniciando sistema. Ele irá mostrar dados 15 vezes durante 15 minutos. Será feita a incerção no banco.")
        tempo = 60;
        limite = 15;

    while (limite >=0):
        usoCPU = round(psutil.cpu_freq(percpu=False).current / pow(10, 3), 2)
        porcentagemCPU = (psutil.cpu_percent(interval = 1))
        usoRAM = round(psutil.virtual_memory().used / pow(10, 9), 2)
        porcentagemRAM = psutil.virtual_memory().percent
        print("Uso CPU: {}GHz\nPorcentagem de uso da CPU: {}%\n\nUso de memória RAM: {}GB\nPorcentagem RAM: {}%\n".format(usoCPU, porcentagemCPU, usoRAM, porcentagemRAM))
        if (modo == 3):
            sql = "INSERT INTO DadoComputador VALUES (default, default, %s, %s, %s, %s, %s)"
            val = (porcentagemCPU, porcentagemRAM, usoCPU,  usoRAM, idMaquina)
            cursor.execute(sql, val)
            mydb.commit()
            print(cursor.rowcount, "record inserted.")
        elif (modo == 2):
            if (porcentagemRAM >= 90):
                print("A RAM está com uso excessivo!")
            if (porcentagemCPU >= 70):
                print("A CPU esta com uso excessivo!")
        print(limite)
        limite = limite - 1;
        time.sleep(tempo)