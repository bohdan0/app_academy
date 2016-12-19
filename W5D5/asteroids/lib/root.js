const Utils = require("./utils.js");
// const bullet = require("./bullet.js");
// const ship = require("./ship.js");
const GameView = require("./game_view.js");
const Game = require("./game.js");
const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

document.addEventListener("DOMContentLoaded", function() {
let ast = document.getElementById("game-canvas");
const ctx = ast.getContext("2d");
window.Game = Game;
const game = new Game();
window.game = game;
const view = new GameView(game, ctx);
window.view = view;
view.start();
});
