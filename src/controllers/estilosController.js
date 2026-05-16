var estilosModel = require("../models/estilosModel");

function CaptarEstilos(req, res) {
    estilosModel.CaptarEstilos().then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    CaptarEstilos
}