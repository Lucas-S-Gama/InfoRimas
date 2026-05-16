var express = require("express");
var router = express.Router();

var termosController = require("../controllers/termosController");

router.get("/CaptarTermos", function(req, res) {
    termosController.CaptarTermos(req, res);
})

module.exports = router;