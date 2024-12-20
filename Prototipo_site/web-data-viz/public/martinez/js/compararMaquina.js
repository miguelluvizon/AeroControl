const dadosMaquinas = [
    { setor: "1", maquina: "PC1000", usoCPU: 30, usoRAM: 45 },
    { setor: "1", maquina: "PC2000", usoCPU: 50, usoRAM: 55 },
    { setor: "1", maquina: "PC7000", usoCPU: 20, usoRAM: 60 },
    { setor: "1", maquina: "PC7000", usoCPU: 60, usoRAM: 80 },
    { setor: "2", maquina: "PC3000", usoCPU: 65, usoRAM: 60 },
    { setor: "2", maquina: "PC4000", usoCPU: 40, usoRAM: 35 },
    { setor: "2", maquina: "PC4000", usoCPU: 14, usoRAM: 56 },
    { setor: "3", maquina: "PC5000", usoCPU: 70, usoRAM: 85 },
    { setor: "3", maquina: "PC6000", usoCPU: 80, usoRAM: 75 }
];

const ctxComponent = document.getElementById('alertChart-maquina').getContext('2d');
const componentsChart = new Chart(ctxComponent, {
    type: 'line',
    data: {
        labels: [],
        datasets: [
            {
                label: 'CPU (%)',
                data: [],
                borderColor: '#a340d6',
                fill: false,
                tension: 0.1
            },
            {
                label: 'Memória RAM (%)',
                data: [],
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
                    color: 'black'
                }
            },

            x: {
                ticks: {
                    color: 'black',
                }
            }
        },
        plugins: {
            legend: {
                display: true,
                labels: {
                    color: 'black'
                }
            }
        }
    }
});

document.getElementById("setor").addEventListener('change', function (event) {
    const setorSelecionado = event.target.value
    atualizarGrafico(setorSelecionado)
})

function atualizarGrafico(setor) {
    const maquinasFiltradas = dadosMaquinas.filter(maquina => maquina.setor === setor)

    const labels = maquinasFiltradas.map(maquina => maquina.maquina)
    const usoCPU = maquinasFiltradas.map(maquina => maquina.usoCPU)
    const usoRAM = maquinasFiltradas.map(maquina => maquina.usoRAM)

    componentsChart.data.labels = labels
    componentsChart.data.datasets[0].data = usoCPU
    componentsChart.data.datasets[1].data = usoRAM

    componentsChart.update()
}

function atualizarGraficoSetor(setor) {
    const setorNome = document.getElementById("setorNome")
    let data = [];
    let label = "";

    if (setor === "4") {
        label = "Torre de Controle";
        data = [20, 15, 10, 5];
        setorNome.textContent = "Torre de Controle"
    } else if (setor === "5") {
        label = "Despache de Voo";
        data = [10, 12, 8, 2];
        setorNome.textContent = "Despache de Voo"
    } else if (setor === "6") {
        label = "Centro de Meteorologia";
        data = [5, 10, 15, 20];
        setorNome.textContent = "Centro de Meteorologia"
    }

    alertCharteleMesmo.data.datasets[0].label = label;
    alertCharteleMesmo.data.datasets[0].data = data;
    alertCharteleMesmo.update();
}