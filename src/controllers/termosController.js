var termosModel = require("../models/termosModel");

function CaptarTermos(req, res) {
    termosModel.CaptarTermos().then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    CaptarTermos
}