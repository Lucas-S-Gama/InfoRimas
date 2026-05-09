var rankModel = require("../models/rankModel");

function CaptarModoFavorito(req, res) {
    rankModel.CaptarModoFavorito().then((resultado) => {
        res.status(200).json(resultado);
    });
}

function CaptarTempoFavorito(req, res) {
    rankModel.CaptarTempoFavorito().then((resultado) => {
        res.status(200).json(resultado);
    });
}

function CaptarBeatFavorito(req, res) {
    rankModel.CaptarBeatFavorito().then((resultado) => {
        res.status(200).json(resultado);
    });
}

function CaptarUsuariosComMaisTreinos(req, res) {
    rankModel.CaptarUsuariosComMaisTreinos().then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    CaptarModoFavorito,
    CaptarTempoFavorito,
    CaptarBeatFavorito,
    CaptarUsuariosComMaisTreinos
}