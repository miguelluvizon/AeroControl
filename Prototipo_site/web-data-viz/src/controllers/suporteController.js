var suporteModel = require("../models/suporteModel");
const { get } = require("../routes/empresas");

function getDados(req, res) {
  suporteModel.getDados().then(function(resultado){
      res.status(200).json(resultado);
  }).catch(function(erro){
      res.status(500).json(erro.sqlMessage);
  })
}

function cadastrar(req, res) {
  // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
  var hostname = req.body.hostnameServer;
  var ramTotal = req.body.ramTotalServer;
  var processador = req.body.processadorServer;
  var setor = req.body.setorServer;
  var usuario = req.body.usuarioServer;

  if (hostname == undefined) {
      res.status(400).send("Seu hostname está undefined!");
  } else if (ramTotal == undefined) {
      res.status(400).send("Sua ram está undefined!");
  } else if (processador == undefined) {
      res.status(400).send("Seu processador está undefined!");
  } else if (setor == undefined) {
      res.status(400).send("Seu setor está undefined!");
  } else {

      suporteModel.cadastrar(hostname, ramTotal, processador, usuario, setor)
          .then(
              function (resultado) {
                  res.json(resultado);
              }
          ).catch(
              function (erro) {
                  console.log(erro);
                  console.log(
                      "\nHouve um erro ao realizar o cadastro! Erro: ",
                      erro.sqlMessage
                  );
                  res.status(500).json(erro.sqlMessage);
              }
          );
  }
}

function getSetor(req, res) {
  suporteModel.getSetor()
  .then(function (resposta) {
      if(resposta.length >= 1) {
          res.status(200).json(resposta);
      }
  });
}

function getInformacoes(req, res) {
  suporteModel.getInformacoes()
  .then(function (resposta) {
      if(resposta.length >= 1) {
          res.status(200).json(resposta);
      }
  });
}

module.exports = {
  getDados,
  cadastrar,
  getSetor,
  getInformacoes
}