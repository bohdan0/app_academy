Function.prototype.inherit = function(parent) {
  const Surrogate = function() {};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

const Animal = function(name) {
  this.name = name;
};

Animal.prototype.eat = function() {
  return `${this.name} eats`;
};

const Dog = function(name) {
  Animal.call(this, name);
};
Dog.inherit(Animal);

Dog.prototype.bark = function() {
  return `${this.name} barks`;
};

const SuperDog = function(name) {
  Dog.call(this, name);
};
SuperDog.inherit(Dog);

SuperDog.prototype.fly = function() {
  return `Super ${this.name} flies`;
};

let an = new Animal('richie');
let dog = new Dog('fluffy');
let supDog = new SuperDog('batman');

console.log(supDog.eat());
