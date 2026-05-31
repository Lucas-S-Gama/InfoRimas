var treinoModel = require("../models/treinoModel");

function RegistrarTreino(req, res) {
    var fk_idUsuario = req.body.idUsuario;
    var fk_ModoTreino = req.body.idModoTreino;
    var fk_TempoTreino = req.body.idTempoTreino;
    var fk_BeatTreino = req.body.idBeatTreino;

    if (fk_idUsuario == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }

    treinoModel.RegistrarTreino(fk_idUsuario, fk_ModoTreino, fk_TempoTreino, fk_BeatTreino).then(function(resposta){
        res.status(200).send("Treino registrado com sucesso");
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function PegarMusicas(req, res) {
    treinoModel.PegarMusicas().then(function(resultado){
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o nome do beat.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function PegarModoTreino(req, res) {
    treinoModel.PegarModoTreino().then(function(resultado){
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function(erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o nome do Modo.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    })
}

function PegarTempos(req, res) {
    treinoModel.PegarTempos().then(function(resultado){
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function(erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o tempo do treino.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    })
}




module.exports = {
    RegistrarTreino,
    PegarMusicas,
    PegarModoTreino,
    PegarTempos
};