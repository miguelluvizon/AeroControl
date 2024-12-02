function estadoMaquinas() {
    fetch("../analista/estadoMaquinas", {
      method: "GET",
    })
      .then(function (resposta) {
        console.log("resposta:", resposta);

        if (resposta.ok) {
          console.log(resposta);
          resposta.json().then(function (resposta) {
            console.log(`Dados Recebidos: ${JSON.stringify(resposta)}`);
            resposta.reverse();

            plotar(resposta);
          });
        } else {
          console.error("Nenhum dado foi econtrado na API.");
        }
      })
      .catch(function (error) {
        console.error(
          `Erro na obtenção de dados para gráfico: ${error.message}`
        );
      });
  }