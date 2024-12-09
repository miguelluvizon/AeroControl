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

          totalCritico.innerHTML = `${resposta[0].AlertasTotais}`
          totalAtencao.innerHTML = `${resposta[0].AtencaoTotais}`
          
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

          totalMaquinaSetor1.innerHTML = `Máquinas: ${resposta[0].MaquinasTotaisSetor1}`
          TotalMaquinaSetor2.innerHTML = `Máquinas: ${resposta[0].MaquinasTotaisSetor2}`
          totalMaquinaSetor3.innerHTML = `Máquinas: ${resposta[0].MaquinasTotaisSetor3}`
          totalMaqui.innerHTML = `Total de máquinas: ${resposta[0].MaquinasTotaisSetor1 + resposta[0].MaquinasTotaisSetor2 + resposta[0].MaquinasTotaisSetor3}`

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