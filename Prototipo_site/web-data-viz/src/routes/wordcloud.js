var express = require("express");
var router = express.Router();

var wordController = require("../controllers/wordcloudController.js");

router.get("/cloudNuvem", function (req, res) {
    wordController.graficoCloud(req, res);
})

module.exports = router;