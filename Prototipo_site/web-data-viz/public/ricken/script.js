const ctx = document.getElementById('alertChart').getContext('2d');
const alertChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4'],
        datasets: [
            {
                label: 'Torre de Controle',
                data: [20, 15, 10, 5],
                borderColor: '#2c1153',
                backgroundColor: 'transparent',
                borderWidth: 2,
                pointBackgroundColor: '#2c1153',
                pointRadius: 5
            },
            {
                label: 'Despache de Voo',
                data: [10, 12, 8, 2],
                borderColor: '#ff66cc',
                backgroundColor: 'transparent',
                borderWidth: 2,
                pointBackgroundColor: '#ff66cc',
                pointRadius: 5
            },
            {
                label: 'Centro de Meteorologia',
                data: [5, 10, 15, 20],
                borderColor: '#b266ff',
                backgroundColor: 'transparent',
                borderWidth: 2,
                pointBackgroundColor: '#b266ff',
                pointRadius: 5
            }
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
