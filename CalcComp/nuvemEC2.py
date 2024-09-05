import psutil
import time


def monitorar():
    porcentagemCPU = (psutil.cpu_percent(interval = 1))
    usoRAM = round(psutil.virtual_memory().used / pow(10, 9), 2)
    porcentagemRAM = psutil.virtual_memory().percent
    print("Porcentagem de uso da CPU: {}%\n\nUso de memória RAM: {}GB\nPorcentagem RAM: {}%\nTotal do disco: {}%\n GB de disco livre: {}".format( porcentagemCPU, usoRAM, porcentagemRAM))

    
    time.sleep(2)
    monitorar()
monitorar()