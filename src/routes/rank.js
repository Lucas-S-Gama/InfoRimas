var express = require("express");
var router = express.Router();

var rankController = require("../controllers/rankController");

router.get("/CaptarModoFavorito" , function(req, res) {
    rankController.CaptarModoFavorito(req, res);
})

router.get("/CaptarTempoFavorito" , function(req, res) {
    rankController.CaptarTempoFavorito(req, res);
})

router.get("/CaptarBeatFavorito" , function(req, res) {
    rankController.CaptarBeatFavorito(req, res);
})

router.get("/CaptarUsuariosComMaisTreinos" , function(req, res) {
    rankController.CaptarUsuariosComMaisTreinos(req, res);
})

router.get("/CaptarHistoricoSeteDiasUser/:nome", function(req,res) {
    rankController.CaptarHistoricoSeteDiasUser(req, res)
})

module.exports = router;