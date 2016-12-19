let MovingObject = require("./moving_object.js");
let Util = require("./utils.js");

let Asteroid = function (pos) {
  this.pos = pos;
  this.vec = randomVec(5);
  this.color = "brown";
  this.radius = 20;
};
Util.inherits(Asteroid, MovingObject);

function randomVec (length) {
  const deg = 2 * Math.PI * Math.random();
  return scale([Math.sin(deg), Math.cos(deg)], length);
}

function scale (vec, m) {
  return [vec[0] * m, vec[1] * m];
}



module.exports = Asteroid;
