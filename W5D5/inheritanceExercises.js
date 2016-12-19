Function.prototype.inherits = function(parentClass) {
  var Surrogate = function() {};
  Surrogate.prototype = parentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject (name) {
  this.name = name;

}

MovingObject.prototype.move = function() {
  console.log('inheritance works');
};

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid (name) {
  MovingObject.call(this, name);
}
Asteroid.inherits(MovingObject);

let ast = new Asteroid('huge');
let movObj = new MovingObject('asteroid');
// console.log(Asteroid.prototype);
