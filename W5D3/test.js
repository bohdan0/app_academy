class Cat {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }

  cuteStatement() {
    return console.log(`${this.owner} loves ${this.name}`);
  }

}
//
// Cat.prototype.cuteStatement = function () {
//     return console.log(`${this.owner} loves ${this.name}`);
//   };

let garfield = new Cat("garfield", "dude");

console.log(garfield.name);

garfield.cuteStatement();
