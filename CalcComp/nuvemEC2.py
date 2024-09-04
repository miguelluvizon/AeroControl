import psutil
import time


def monitorar():
    porcentagemCPU = (psutil.cpu_percent(interval = 1))
    usoRAM = round(psutil.virtual_memory().used / pow(10, 9), 2)
    porcentagemRAM = psutil.virtual_memory().percent
    totalDisco = round(psutil.disk_usage("C:\\").total / pow(10, 9), 2)
    livreDisco = round(psutil.disk_usage("C:\\").free / pow(10, 9), 2)
    print("Porcentagem de uso da CPU: {}%\n\nUso de memória RAM: {}GB\nPorcentagem RAM: {}%\nTotal do disco: {}%\n GB de disco livre: {}".format( porcentagemCPU, usoRAM, porcentagemRAM, totalDisco, livreDisco))

    
    time.sleep(2)
    monitorar()
monitorar()