
const Comp = document.getElementById("Comp");

// Função para trocar o display das divs
function trocarConteudo() {
    const valorSelecionado = Comp.value;

    // Exibir a div correspondente e ocultar a outra
    if (valorSelecionado === "CPU") {
        CPU.style.display = "block";
        RAM.style.display = "none";
    } else if (valorSelecionado === "RAM") {
        CPU.style.display = "none";
        RAM.style.display = "block";
    }
}

// Adicionando evento ao select
Comp.addEventListener("change", trocarConteudo);

// Chamar a função inicialmente para configurar o display das divs
trocarConteudo();

function puxarAlertas() {
    const botaoSelecionado = sessionStorage.getItem("botaoSelecionado");
  

    if (botaoSelecionado === "botao1") {
        setor = 1;
        setorNome.innerHTML = "Despache de voo"
    } else if (botaoSelecionado === "botao2") {
        setor = 2;
        setorNome.innerHTML = "Torre de controle"
    } else if (botaoSelecionado === "botao3") {
        setor = 3;
        setorNome.innerHTML = "Centro de meteorologia"
    }

    console.log(setor)

    fetch(`../empresas/puxarAlertas/${setor}`, {
        method: "GET",
    })
        .then(function (resposta) {
            console.log("resposta:", resposta);

            if (resposta.ok) {
                resposta.json()
                    .then(function (resposta) {
                        console.log(resposta)

                        alertasTotalCPU.innerHTML = `${resposta[0].total_cpu}`
                        alertasTotalRAM.innerHTML = `${resposta[0].total_ram}`
                    })
            } else {
                throw "Houve ao puxar qtd";
            }
        })
        .catch(function (resposta) {
            console.log(`#ERRO: ${resposta}`);
        });

    return false;
}
var setor = 0;
function puxarAlertasCriticos() {
    const botaoSelecionado = sessionStorage.getItem("botaoSelecionado");
    

    if (botaoSelecionado === "botao1") {
        setor = 1;
    } else if (botaoSelecionado === "botao2") {
        setor = 2;
    } else if (botaoSelecionado === "botao3") {
        setor = 3;
    }

    var componente = document.getElementById('Comp').value

    fetch(`../empresas/puxarAlertasCriticos/${setor}/${componente}`, {
        method: "GET",
    })
        .then(function (resposta) {
            console.log("resposta:", resposta);

            if (resposta.ok) {
                resposta.json()
                    .then(function (resposta) {
                        console.log(resposta)

                        var totalAlertasCPU = 0;
                        var totalAlertasRAM = 0;

                        
                        for (var index = 0; index < resposta.length; index++) {
                            totalAlertasCPU += Number(resposta[index].total_alertas_cpu);
                            totalAlertasRAM += Number(resposta[index].total_alertas_ram);
                        }

                        alertasTotaisCriticosCPU.innerHTML = `${totalAlertasCPU}`
                        alertasTotaisCriticosRAM.innerHTML = `${totalAlertasRAM}`
                    })
            } else {
                throw "Houve ao puxar qtd";
            }
        })
        .catch(function (resposta) {
            console.log(`#ERRO: ${resposta}`);
        });

    return false;
}

function puxarTotalMaquinas() {
    const botaoSelecionado = sessionStorage.getItem("botaoSelecionado");
    

    if (botaoSelecionado === "botao1") {
        setor = 1;
    } else if (botaoSelecionado === "botao2") {
        setor = 2;
    } else if (botaoSelecionado === "botao3") {
        setor = 3;
    }

    fetch(`../empresas/puxarTotalMaquinas/${setor}`, {
        method: "GET",
    })
        .then(function (resposta) {
            console.log("resposta:", resposta);

            if (resposta.ok) {
                resposta.json()
                    .then(function (resposta) {
                        console.log(resposta)

                        totalMaquinas.innerHTML = `${resposta[0].total_maquinas}`
                    })
            } else {
                throw "Houve ao puxar qtd";
            }
        })
        .catch(function (resposta) {
            console.log(`#ERRO: ${resposta}`);
        });

    return false;
}

function puxarMediaTotal() {
    const botaoSelecionado = sessionStorage.getItem("botaoSelecionado");
  

    if (botaoSelecionado === "botao1") {
        setor = 1;
    } else if (botaoSelecionado === "botao2") {
        setor = 2;
    } else if (botaoSelecionado === "botao3") {
        setor = 3;
    }

    var cardCPU = document.getElementById('cardMediaCPU')
    var cardRAM = document.getElementById('cardMediaRAM')
    fetch(`../empresas/puxarMediaTotal/${setor}`, {
        method: "GET",
    })
        .then(function (resposta) {
            console.log("resposta:", resposta);

            if (resposta.ok) {
                resposta.json()
                    .then(function (resposta) {
                        console.log(resposta)

                        mediaTotalCPU.innerHTML = `${resposta[0].mediaTotal_CPU}%`
                        mediaTotalRAM.innerHTML = `${resposta[0].mediaTotal_RAM}%`

                        if (resposta[0].mediaTotal_CPU >= 80) {
                            cardCPU.classList.toggle("ativarVermelho");
                        } else if (resposta[0].mediaTotal_CPU >= 50 && resposta[0].mediaTotal_CPU < 80) {
                            cardCPU.classList.toggle("ativarAmarelo");
                        } else if (resposta[0].mediaTotal_CPU >= 0 && resposta[0].mediaTotal_CPU < 50) {
                            cardCPU.classList.toggle("ativarVerde");
                        }

                        if (resposta[0].mediaTotal_RAM >= 80) {
                            cardRAM.classList.toggle("ativarVermelho");
                        } else if (resposta[0].mediaTotal_RAM >= 50 && resposta[0].mediaTotal_RAM < 80) {
                            cardRAM.classList.toggle("ativarAmarelo");
                        } else if (resposta[0].mediaTotal_RAM >= 0 && resposta[0].mediaTotal_RAM < 50) {
                            cardRAM.classList.toggle("ativarVerde");
                        }
                    })
            } else {
                throw "Houve ao puxar a média";
            }
        })
        .catch(function (resposta) {
            console.log(`#ERRO: ${resposta}`);
        });

    return false;
}

let graficoAlertasCPU
let graficoAlertasRAM

function rankearAlertasTotais() {
    const botaoSelecionado = sessionStorage.getItem("botaoSelecionado");
   
    if (botaoSelecionado === "botao1") {
        setor = 1;
    } else if (botaoSelecionado === "botao2") {
        setor = 2;
    } else if (botaoSelecionado === "botao3") {
        setor = 3;
    }

    var componente = document.getElementById('Comp').value

    fetch(`/empresas/rankearAlertasTotais/${componente}/${setor}`)
        .then(response => response.json())
        .then(data => {
            console.log(data)

            if (graficoAlertasCPU) {
                graficoAlertasCPU.destroy();
            }

            if (graficoAlertasRAM) {
                graficoAlertasRAM.destroy()
            }

            const maquinas = data.map(item => item.Maquina);
            const qtd_alertas = data.map(item => item.total_alertas);

            if (componente == "CPU") {
                const ctx = document.getElementById('alertChart').getContext('2d');
                graficoAlertasCPU = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: maquinas,
                        datasets: [
                            {
                                label: 'Torre de Controle',
                                data: qtd_alertas,
                                backgroundColor: '#472c72',
                                pointBackgroundColor: '#2c1153',
                                pointRadius: 5
                            },
                        ]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: false
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 5
                                }
                            }
                        }
                    }
                });
            } else {
                const ctx3 = document.getElementById('alertChart3').getContext('2d');
                graficoAlertasRAM = new Chart(ctx3, {
                    type: 'bar',
                    data: {
                        labels: maquinas,
                        datasets: [
                            {
                                label: 'Torre de Controle',
                                data: qtd_alertas,
                                backgroundColor: '#472c72',
                                pointBackgroundColor: '#2c1153',
                                pointRadius: 5
                            },
                        ]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: false
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 5
                                }
                            }
                        }
                    }
                });
            }
        })
        .catch(error => console.error('Erro ao plotar gráfico', error));
}

let graficoCriticoCPU
let graficoCriticoRAM

function rankearMaquinasCriticas() {
    const botaoSelecionado = sessionStorage.getItem("botaoSelecionado");
  

    if (botaoSelecionado === "botao1") {
        setor = 1;
    } else if (botaoSelecionado === "botao2") {
        setor = 2;
    } else if (botaoSelecionado === "botao3") {
        setor = 3;
    }

    fetch(`../empresas/rankearMaquinasCriticas/${setor}`)
        .then(response => response.json())
        .then(data => {
            console.log(data)

            var maquinas = data.map(item => item.Maquina);
            var mediasCriticasCPU = data.map(item => item.mediaCPU);
            var mediasCriticasRAM = data.map(item => item.mediaRAM);

            var vetorMaquinasCPU = [];
            var vetorCPU = [];
            var vetorMaquinasRam = [];
            var vetorRAM = [];

            for (var index = 0; index < maquinas.length; index++) {
                console.log(mediasCriticasCPU[index])
                
                if (mediasCriticasCPU[index] > 80) {
                    vetorMaquinasCPU.push(maquinas[index])
                    vetorCPU.push(mediasCriticasCPU[index])
                }

                if (mediasCriticasRAM[index] > 80) {
                    vetorMaquinasRam.push(maquinas[index])
                    vetorRAM.push(mediasCriticasRAM[index])
                }
            }

                const ctx2 = document.getElementById('alertChart2').getContext('2d');
                graficoCriticoCPU = new Chart(ctx2, {
                    type: 'bar',
                    data: {
                        labels: vetorMaquinasCPU,
                        datasets: [
                            {
                                label: 'Torre de Controle',
                                data: vetorCPU,
                                backgroundColor: '#472c72',
                                pointBackgroundColor: '#2c1153',
                                pointRadius: 5
                            },
                        ]
                    },
                    options: {
                        indexAxis: 'y',
                        responsive: true,
                        plugins: {
                            legend: {
                                display: false
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 5
                                }
                            }
                        }
                    }
                });
            

            
                const ctx4 = document.getElementById('alertChart4').getContext('2d');
                graficoCriticoRAM = new Chart(ctx4, {
                    type: 'bar',
                    data: {
                        labels: vetorMaquinasRam,
                        datasets: [
                            {
                                label: 'Torre de Controle',
                                data: vetorRAM,
                                backgroundColor: '#472c72',
                                pointBackgroundColor: '#2c1153',
                                pointRadius: 5
                            },
                        ]
                    },
                    options: {
                        indexAxis: 'y',
                        responsive: true,
                        plugins: {
                            legend: {
                                display: false
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 5
                                }
                            }
                        }
                    }
                });
            
        })
        .catch(error => console.error('Erro ao plotar gráfico', error));
}


function limparSessao() {
    sessionStorage.clear();
    window.location = "../index.html";
}

const sair = document.getElementById("botaoSair")

sair.addEventListener('click', () => {
    limparSessao()
})
