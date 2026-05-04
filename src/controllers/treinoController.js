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

function PegarURLMusica(req, res) {
    var BeatNome = req.params.BeatNome;

    treinoModel.PegarURLMusica(BeatNome).then(function(resultado){
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

function ListarInfosModoTreino(req, res) {
    var ModoNome = req.params.ModoNome;

    treinoModel.ListarInfosModoTreino(ModoNome).then(function(resultado){
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

function PegarTempoTreino(req, res) {
    var TempoDeTreino = req.params.TempoDeTreino;

    treinoModel.PegarTempoTreino(TempoDeTreino).then(function(resultado){
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
    PegarURLMusica,
    ListarInfosModoTreino,
    PegarTempoTreino
};