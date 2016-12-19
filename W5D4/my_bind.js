class Cat {
  constructor(name) {
    this.name = name;
  }

  meow() {
    console.log(`${this.name} says meow!`);
  }
}
// const lamp = new Lamp();
// const boundTurnOn = turnOn.myBind(lamp);
// boundTurnOn();

const curie = new Cat('curie');


Function.prototype.myBind = function (object) {
  return () => this.apply(object);
};
setTimeout(curie.meow.myBind(curie), 1000);
