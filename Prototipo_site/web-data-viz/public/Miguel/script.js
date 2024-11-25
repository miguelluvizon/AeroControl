

const ctx2 = document.getElementById('alertChart2').getContext('2d');
const alertChart2 = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8', 'M9', 'M10'],
        datasets: [
            {
                label: 'Torre de Controle',
                data: [100, 75, 30, 50, 60, 90, 93, 88, 99, 100],
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

const ctx3 = document.getElementById('alertChart3').getContext('2d');
const alertChart3 = new Chart(ctx3, {
    type: 'bar',
    data: {
        labels: ['M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8', 'M9', 'M10'],
        datasets: [
            {
                label: 'Torre de Controle',
                data: [20, 15, 100, 30, 40, 80, 95, 100, 60, 70],
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

const ctx4 = document.getElementById('alertChart4').getContext('2d');
const alertChart4 = new Chart(ctx4, {
    type: 'bar',
    data: {
        labels: ['M1', 'M2', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8', 'M9', 'M10'],
        datasets: [
            {
                label: 'Torre de Controle',
                data: [100, 75, 30, 50, 60, 90, 93, 88, 99, 100],
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


const Comp = document.getElementById("Comp");

// Função para trocar o display das divs
function trocarConteudo() {
    const valorSelecionado = Comp.value;

    // Exibir a div correspondente e ocultar a outra
    if (valorSelecionado === "1") {
        CPU.style.display = "block";
        RAM.style.display = "none";
    } else if (valorSelecionado === "2") {
        CPU.style.display = "none";
        RAM.style.display = "block";
    }
}

// Adicionando evento ao select
Comp.addEventListener("change", trocarConteudo);

// Chamar a função inicialmente para configurar o display das divs
trocarConteudo();

function puxarAlertas() {
    fetch("../empresas/puxarAlertas", {
        method: "GET",
    })
        .then(function (resposta) {
            console.log("resposta:", resposta);

            if (resposta.ok) {
                resposta.json()
                    .then(function (resposta) {
                        console.log(resposta)

                        alertasTotal.innerHTML = `${resposta[0].total_linhas}`
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

function puxarAlertasCriticos() {
    fetch("../empresas/puxarAlertasCriticos", {
        method: "GET",
    })
        .then(function (resposta) {
            console.log("resposta:", resposta);

            if (resposta.ok) {
                resposta.json()
                    .then(function (resposta) {
                        console.log(resposta)

                        alertasTotaisCriticos.innerHTML = `${resposta[0].somaTotal}`
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
    fetch("../empresas/puxarTotalMaquinas", {
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
    fetch("../empresas/puxarMediaTotal", {
        method: "GET",
    })
        .then(function (resposta) {
            console.log("resposta:", resposta);

            if (resposta.ok) {
                resposta.json()
                    .then(function (resposta) {
                        console.log(resposta)

                        mediaTotal.innerHTML = `${resposta[0].mediaTotal_CPU}`
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

let graficoAlertas

function rankearAlertasTotais() {
    fetch("../empresas/rankearAlertasTotais")
    .then(response => response.json())
    .then(data => {
        console.log(data)

        const maquinas = data.map(item => item.Maquina);
        const qtd_alertas = data.map(item => item.total_alertas);
        
        const ctx = document.getElementById('alertChart').getContext('2d');
        graficoAlertas = new Chart(ctx, {
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
    })
    .catch(error => console.error('Erro ao plotar gráfico', error));
}


