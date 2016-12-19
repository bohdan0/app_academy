class Animal {
  constructor(name) {
    this.name = name;
  }

  eat() {
    return `${this.name} eats`;
  }
}

class Dog extends Animal {
  constructor(name) {
    super(name);
  }

  bark() {
    return `${this.name} barks`;
  }
}

class SuperDog extends Dog {
  constructor(name) {
    super(name);
  }

  fly() {
    return `Super ${this.name} flies`;
  }
}

let an = new Animal('richie');
let dog = new Dog('fluffy');
let supDog = new SuperDog('batman');

console.log(an.fly());
