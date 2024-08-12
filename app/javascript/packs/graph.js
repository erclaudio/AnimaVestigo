// app/javascript/packs/graph.js
import Chart from 'chart.js/auto';
import 'chartjs-adapter-date-fns';

document.addEventListener("DOMContentLoaded", function() {
  const ctx = document.getElementById('scoreChart').getContext('2d');
  const scoreChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["2024-08-09", "2024-08-10", "2024-08-11"], // Replace with your dynamic data
      datasets: [{
        label: 'Score',
        data: [55, 65, 75], // Replace with your dynamic data
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1,
        fill: false
      }]
    },
    options: {
      scales: {
        x: {
          type: 'time',
          time: {
            unit: 'day'
          },
          title: {
            display: true,
            text: 'Date'
          }
        },
        y: {
          beginAtZero: true,
          max: 100,
          title: {
            display: true,
            text: 'Score'
          }
        }
      }
    }
  });
});
