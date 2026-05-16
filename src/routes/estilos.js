var express = require("express");
var router = express.Router();

var estilosController = require("../controllers/estilosController");

router.get("/CaptarEstilos", function(req, res) {
    estilosController.CaptarEstilos(req, res);
})

module.exports = router;