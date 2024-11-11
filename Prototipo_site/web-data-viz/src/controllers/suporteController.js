var suporteModel = require("../models/suporteModel");

function plotar(req, res) {
  suporteModel.plotar().then(function(resultado){
      // precisamos informar que o resultado voltará para o front-end como uma resposta em json
      res.status(200).json(resultado);
  }).catch(function(erro){
      res.status(500).json(erro.sqlMessage);
  })
}

function cadastrar(req, res) {
  var nome = req.body.nome;

  if (nome == undefined) {
      res.status(400).send("Seu nome está undefined!");
  }

  suporteModel.cadastrar(nome).then(function(resposta){
      res.status(200).send("suporte criado com sucesso");
  }).catch(function(erro){
      res.status(500).json(erro.sqlMessage);
  })
}

module.exports = {
  plotar,
  cadastrar
}