var empresaModel = require("../models/empresaModel");

function buscarPorCnpj(req, res) {
  var cnpj = req.query.cnpj;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function listar(req, res) {
  empresaModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

function buscarPorId(req, res) {
  var id = req.params.id;

  empresaModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function cadastrar(req, res) {
  var cnpj = req.body.cnpj;
  var razaoSocial = req.body.razaoSocial;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    if (resultado.length > 0) {
      res
        .status(401)
        .json({ mensagem: `a empresa com o cnpj ${cnpj} já existe` });
    } else {
      empresaModel.cadastrar(razaoSocial, cnpj).then((resultado) => {
        res.status(201).json(resultado);
      });
    }
  });
}

function getEmpresas(req, res) {
  empresaModel.getEmpresas()
  .then(function (resposta) {
      if(resposta.length >= 1) {
          res.status(200).json(resposta);
      }
  });
}

function puxarAlertas (req, res) { // rota luvizones
  console.log("puxando total de alertas")
  empresaModel.puxarAlertas()
  .then(function (resposta) {
      if(resposta.length > 0) {
          res.status(200).json(resposta);
      } else {
        res.status(204).send("nenhum resultado encontrado")
      }

  }).catch(function (erro) {
    console.log(erro);
    console.log("houve um erro ao buscar resultados", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage)
  });
}

function puxarTotalMaquinas(req, res) { // rota luvizones
  console.log("puxando total de maquinas")
  empresaModel.puxarTotalMaquinas()
  .then(function (resposta) {
      if(resposta.length > 0) {
          res.status(200).json(resposta);
      
      } else {
        res.status(204).send("nenhum resultado encontrado")
      }

  }).catch(function (erro) {
    console.log(erro);
    console.log("houve um erro ao buscar resultados", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage)
  });
}

function puxarMediaTotal(req, res) { // rota luvizones
  console.log("puxando total de maquinas")
  empresaModel.puxarTotalMaquinas()
  .then(function (resposta) {
      if(resposta.length > 0) {
          res.status(200).json(resposta);
      
      } else {
        res.status(204).send("nenhum resultado encontrado")
      }

  }).catch(function (erro) {
    console.log(erro);
    console.log("houve um erro ao buscar resultados", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage)
  });
}

module.exports = {
  buscarPorCnpj,
  buscarPorId,
  cadastrar,
  listar,
  getEmpresas,
  puxarAlertas, // rota luvizones
  puxarTotalMaquinas, // rota luvizones
  puxarMediaTotal // rota luvizones
};
