var suporteArthurModel = require("../models/suporteArthurModel.js");
const { get } = require("../routes/suporteArthur");

function buscarUltimasMedidas(req, res) {
    var idMaquina = req.params.idMaquina;

    console.log(`Recuperando as ultimas medidas para a máquina: ${idMaquina}`);

    suporteArthurModel.buscarUltimasMedidas(idMaquina).then(function (resultado) {
        console.log("Cheguei na rota buscarUltimasMedidas");
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum dado encontrado!");
        }
    }).catch(function (erro) {
        console.log("Houve um erro ao buscar as ultimas medidas:", erro.sqlMessage);
        // Envia o erro com status 500
        res.status(500).json({ mensagem: "Erro ao acessar os dados da máquina", erro: erro.sqlMessage });
    });
}


function buscarMedidasEmTempoReal(req, res) {

    var idMaquina = req.params.idMaquina;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idMaquina).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMaquinasPorUsuario(req, res) {
    var idUsuario = req.params.idUsuario;
    
    suporteArthurModel.buscarMaquinasPorUsuario(cpf).then((resultado) => {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).json([]);
      }
    }).catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar as maquinas: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
  }

module.exports = {
    buscarMaquinasPorUsuario,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal

}