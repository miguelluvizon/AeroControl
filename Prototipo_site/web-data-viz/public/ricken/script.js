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

function estadoSetor() {
  fetch("../analista/estadoSetor", {
    method: "GET",
  })
    .then(function (resposta) {
      console.log("resposta:", resposta);

      if (resposta.ok) {
        console.log(resposta);
        resposta.json().then(function (resposta) {
          console.log(`Dados Recebidos: ${JSON.stringify(resposta)}`);
          resposta.reverse();

          plotarSetor1(resposta);
          plotarSetor2(resposta);
          plotarSetor3(resposta);

          totalMaquinaSetor1.innerHTML = `Máquinas: ${resposta[0].DadosTotaisSetor1}`
          TotalMaquinaSetor2.innerHTML = `Máquinas: ${resposta[0].DadosTotaisSetor2}`
          totalMaquinaSetor3.innerHTML = `Máquinas: ${resposta[0].DadosTotaisSetor3}`
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