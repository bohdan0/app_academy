let MovingObject = function (options) {
    this.pos = options["pos"];
    this.vec = options["vec"];
    this.radius = options["radius"];
    this.color = options["color"];
};

MovingObject.prototype.draw = function(ctx) {
  // ctx.clearRect(0, 0, 1000, 1000);
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};



MovingObject.prototype.move = function() {
  this.pos = [this.pos[0] + this.vec[0],  this.pos[1] + this.vec[1]];
};

MovingObject.prototype.test = function() {
  console.log("works!");
};







module.exports = MovingObject;
