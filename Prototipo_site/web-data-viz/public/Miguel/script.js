const ctx = document.getElementById('alertChart').getContext('2d');
const alertChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['maquina 1', 'maquina 2', 'maquina 3', 'maquina 4', 'maquina 5'],
        datasets: [
            {
                label: 'Torre de Controle',
                data: [20, 15, 100, 30, 40],
                borderColor: '#2c1153',
                backgroundColor: '#472c72',
                borderWidth: 2,
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

const ctx2 = document.getElementById('alertChart2').getContext('2d');
const alertChart2 = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['maquina 1', 'maquina 2', 'maquina 3', 'maquina 4', 'maquina 5'],
        datasets: [
            {
                label: 'Torre de Controle',
                data: [100, 75, 30, 50, 60],
                borderColor: '#2c1153',
                backgroundColor: '#472c72',
                borderWidth: 2,
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
