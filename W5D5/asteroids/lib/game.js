const Asteroid = require("./asteroid.js");

let Game = function() {
  this.DIM_X = 1000;
  this.DIM_Y = 1000;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.addAsteroids();
};

Game.prototype.addAsteroids = function() {
  for(let i = 0; i < this.NUM_ASTEROIDS; i++) {
    let pos = this.randomPosition();
    this.asteroids.push(new Asteroid(pos));
  }
};

Game.prototype.randomPosition = function () {
  return [Math.random() * this.DIM_X, Math.random() * this.DIM_Y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  ctx.fillStyle = "#000000";
  ctx.fill();

  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  for(let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
  // debugger
};

Game.prototype.moveObject = function () {
  for(let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
};
module.exports = Game;
