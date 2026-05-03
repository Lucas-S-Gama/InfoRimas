var express = require("express");
var router = express.Router();

var treinoController = require("../controllers/treinoController");

router.post("/RegistrarTreino", function (req, res) {
    treinoController.RegistrarTreino(req, res);
});

router.get("/PegarURLMusica/:BeatNome", function(req, res) {
    treinoController.PegarURLMusica(req, res);
});

router.get("/ListarInfosModoTreino/:ModoNome", function(req, res) {
    treinoController.ListarInfosModoTreino(req, res)
});

router.get("/PegarTempoTreino/:TempoDeTreino", function(req, res) {
    treinoController.PegarTempoTreino(req, res)
});


module.exports = router;