// AMIGOS, EU NÃO AGUENTO MAIS FAZER ISSO, HTML E CSS SÃO COISA DO DEMONIO.
// NÃO SEI COMO INVENTARAM ISSO, TEM COISA NO CÓDIGO QUE SÓ DEUS SABE COMO TA FUNCIONANDO

// Gráfico de Uso de CPU
const ctxCpu = document.getElementById('cpuChart').getContext('2d');
const cpuChart = new Chart(ctxCpu, {
    type: 'bar',
    data: {
        labels: ['PC001', 'PC002', 'PC003', 'PC004'],
        datasets: [{
            label: 'Uso da CPU (%)',
            data: [75, 60, 85, 50],
            backgroundColor: '#a340d6',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true,
                max: 100,
                ticks: {
                    color: 'white'
                }
            },
            x: {
                ticks: {
                    color: 'white',
                }
            }
        },
        plugins: {
            legend: {
                display: true,
                labels: {
                    color: 'white'
                }
            }
        }
    }
});

// Gráfico de Uso de Memória RAM
const ctxRam = document.getElementById('ramChart').getContext('2d');
const ramChart = new Chart(ctxRam, {
    type: 'bar',
    data: {
        labels: ['PC001', 'PC002', 'PC003', 'PC004'],
        datasets: [{
            label: 'Uso da Memória RAM (%)',
            data: [50, 45, 70, 40],
            backgroundColor: '#a340d6',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true,
                max: 100,
                ticks: {
                    color: 'white'
                }
            },
            x: {
                ticks: {
                    color: 'white',
                }
            }
        },
        plugins: {
            legend: {
                display: true,
                labels: {
                    color: 'white'
                }
            }
        }
    }
});

// Gráfico de Comparação Mensal de Problemas entre Setores ( NÃO AGUENTO MAIS)
const ctxSetor = document.getElementById('sectorChart').getContext('2d');
const sectorChart = new Chart(ctxSetor, {
    type: 'line',
    data: {
        labels: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4'],
        datasets: [
            {
                label: 'Torre de Controle',
                data: [20, 15, 10, 5],
                borderColor: '#a340d6',
                fill: false,
                tension: 0.1
            },
            {
                label: 'Despache de Voo',
                data: [5, 10, 15, 20],
                borderColor: '#ff4c4c',
                fill: false,
                tension: 0.1
            },
            {
                label: 'Centro de Meteorologia',
                data: [10, 12, 8, 6],
                borderColor: '#2ecc71',
                fill: false,
                tension: 0.1
            }
        ]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    color: 'white'
                }
            },
            x: {
                ticks: {
                    color: 'white',
                }
            }
        },
        plugins: {
            legend: {
                display: true,
                labels: {
                    color: 'white'
                }
            }
        }
    }
});

// Gráfico de Comparação Semanal de Componentes das Máquinas
const ctxComponent = document.getElementById('componentsChart').getContext('2d');
const componentsChart = new Chart(ctxComponent, {
    type: 'line',
    data: {
        labels: ['PC1000', 'PC2000', 'PC3000', 'PC4000'],
        datasets: [
            {
                label: 'CPU',
                data: [50, 60, 55, 70],
                borderColor: '#a340d6',
                fill: false,
                tension: 0.1
            },
            {
                label: 'Memória RAM',
                data: [40, 45, 50, 65],
                borderColor: '#ffae42',
                fill: false,
                tension: 0.1
            }
        ]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    color: 'white'
                }
            },

            x: {
                ticks: {
                    color: 'white',
                }
            }
        },
        plugins: {
            legend: {
                display: true,
                labels: {
                    color: 'white'
                }
            }
        }
    }
});
