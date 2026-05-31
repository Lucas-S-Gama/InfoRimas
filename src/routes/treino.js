var express = require("express");
var router = express.Router();

var treinoController = require("../controllers/treinoController");

router.post("/RegistrarTreino", function (req, res) {
    treinoController.RegistrarTreino(req, res);
});

router.get("/PegarMusicas", function(req, res) {
    treinoController.PegarMusicas(req, res);
});

router.get("/PegarModoTreino", function(req, res) {
    treinoController.PegarModoTreino(req, res)
});

router.get("/PegarTempos", function(req, res) {
    treinoController.PegarTempos(req, res)
});


module.exports = router;