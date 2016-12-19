function sum(numbers) {
  console.log(numbers);
  let sumed = 0;
  for (let i = 0; i < numbers.length; i++) {
    sumed += numbers[i];
  }

  return sumed;
}

// console.log(sum(1,2,3,4));


Function.prototype.myBind = function (object, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(object, bindArgs.concat(callArgs));
  };
};


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
markov.says.myBind(breakfast, "meow"()
let unfinished = markov.says.myBind(breakfast, "meow", "Kush");
let sayIt = unfinished();


let saveForLater = markov.says.myBind(breakfast, "meow")
let meowKush = saveForLater("Kush");
let meowJenn = saveForLater("Jenn");


function curriedSum(numArrgs) {
  let output = [];
  function _curriedSum(number) {
      output.push(number);
      if (output.length === numArrgs) {
        return sum(output);
      } else {
        return _curriedSum;
      }
  }
  return _curriedSum;
}



//
// const sum1 = curriedSum(4);
// console.log(sum1(5)(30)(20)(1));

Function.prototype.curry = function (numArgs) {
    let output = [];
    // let that = this;
    let  _curried = (number) => {
        output.push(number);
        if (output.length === numArgs) {
          return this(output);
        } else {
          return _curried;
        }
    };
    return _curried;
};


Function.prototype.curry1 = function (numArgs) {
    let output = [];
    let that = this;
    let  _curried = (number) => {
        output.push(number);
        console.log(number);
        if (output.length === numArgs) {
          console.log(output);
          console.log(this);
          return that.apply(global, [output]);
        } else {
          return _curried;
        }
    };
    return _curried;
};

let abc = sum.curry1(4);
console.log(abc(1)(2)(3)(4));

console.log(sum([1,2,3,4,5]));





















//
