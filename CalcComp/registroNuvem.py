import psutil
import time
import mysql.connector

mydb = mysql.connector.connect(user='inserirNuvem', password='aerocontrol', host='10.18.33.33', database='calculo')

cursor = mydb.cursor()

def monitorar():
    idMaquina = 4;
    usoCPU = round(psutil.cpu_freq(percpu=False).current / pow(10, 3), 2)
    porcentagemCPU = (psutil.cpu_percent(interval = 1))
    usoRAM = round(psutil.virtual_memory().used / pow(10, 9), 2)
    porcentagemRAM = psutil.virtual_memory().percent
    porcentagemDisco = psutil.disk_usage("C:\\").percent
    print("Uso CPU: {}GHz\nPorcentagem de uso da CPU: {}%\n\nUso de memória RAM: {}GB\nPorcentagem RAM: {}%\n\nPorcentagem de uso de disco: {}%\n".format(usoCPU, porcentagemCPU, usoRAM, porcentagemRAM, porcentagemDisco))

    sql = "INSERT INTO Dados VALUES (default, %s, default, %s, %s, %s, %s, %s)"
    val = (idMaquina, usoCPU, porcentagemCPU, usoRAM, porcentagemRAM, porcentagemDisco)
    cursor.execute(sql, val)
    mydb.commit()
    print(cursor.rowcount, "record inserted.")
    
    time.sleep(2)
    monitorar()
monitorar()