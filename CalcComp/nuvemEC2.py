import psutil
import time


def monitorar():
    porcentagemCPU = (psutil.cpu_percent(interval = 1))
    usoRAM = round(psutil.virtual_memory().used / pow(10, 9), 2)
    porcentagemRAM = psutil.virtual_memory().percent

    print(f"Porcentagem de uso da CPU: {porcentagemCPU}%\nUso de memória RAM: {usoRAM}GB\nPorcentagem RAM: {porcentagemRAM}%")

    
    time.sleep(2)
    monitorar()
monitorar()