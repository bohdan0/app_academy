Array.prototype.uniq = function() {
  const newArray = [];
  this.forEach( function(el) {
    if (newArray.indexOf(el) === -1) {
      newArray.push(el);
    }
  }

);
return newArray;
};

Array.prototype.twoSum = function() {
  const result = [];
  this.forEach((el) => {
    const tempArr = this.slice(this.indexOf(el)+1);
    const compliment = tempArr.indexOf(-el);
    if (compliment !== -1) {
      result.push([this.indexOf(el), this.indexOf(-el)]);
    }
  });
  return result;
};

Array.prototype.transpose = function() {
  const newArray = new Array( this[0].length );
  for (let i = 0; i < newArray.length; i++) {
    newArray[i] = new Array(this.length);
  }
  for ( let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[0].length; j++) {
      newArray[j][i] = this[i][j];
    }
  }
  return newArray;
};

Array.prototype.myEach = function(callback) {
  for(let i=0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  const newArray = []; //free

  this.myEach( el => newArray.push(callback(el))); //closure
  return newArray;
};

Array.prototype.myInject = function(callback) {
  let accumulator = 0;
  this.myEach( function(el) {
    accumulator = callback(accumulator, el);
    // console.log(accumulator);
  });
  return accumulator;
};


// .load intro.js
// [1,2,3].myInject( (acc, el) => { return acc + el; });

Array.prototype.bubbleSort = function() {
  for(let i = 0; i < this.length; i++) {
    for(let j = i; j < this.length; j++) {
      if (this[i] > this[j]) {
        // this[i], this[j] = this[j], this[i];
        let temp = this[i];
        this[i] = this[j];
        this[j] = temp;
      }
    }
  }
  return this;
};


// console.log([1,5,7,2,8,4].bubbleSort());


Array.prototype.substrings = function() {
  let result = [];
  for (let i = 0; i <= this.length; i++) {
    for (let j = i; j <= this.length; j++) {
      let temp = this.slice(i,j);
      if ((result.indexOf(temp) === -1) && (temp.length !== 0)) {
        result.push(temp);
      }
    }
  }
  return result;
};

// console.log([1,2,3].substrings());

function range(start, end) {
  if (start >= end - 1) {
    return [];
  }

  return [start + 1].concat(range(start + 1, end));
}

function exp(b, n) {
  if (n === 0) {
    return 1;
  }
  return b * exp(b, n-1);
}

exp(2, 10);

function fibonacci(n) {
  if (n <= 2) {
    return [1, 1].slice(0, n);
  }

  let prev = fibonacci(n - 1);
  return prev.concat([prev[prev.length - 1] + prev[prev.length - 2]]);
}

function binarySearch(array, target) {
  let mid = Math.round((array.length ) / 2) - 1;

  if (array.length === 0) {
    return -1;
  }

  // if (array[mid] === target) {
  //   return mid;
  // }

  let leftSide = array.slice(0, mid);
  let rightSide = array.slice(mid + 1, array.length);

  // console.log(leftSide);
  // console.log(rightSide);
  console.log(`pos ${mid} is ${array[mid]}`);
  //target < mid
  if (target < array[mid]) {
    return binarySearch(leftSide, target);
    //target == mid
  } else if (target === array[mid]) {
    return mid;
    //target > mid
  } else {
    return mid + 1 + binarySearch(rightSide, target);
  }
}

// binarySearch([1,2,3,4,5,6,7], 7);
function mergeSortHelper(arr1, arr2) {
  let result = [];
  while((arr1.length !== 0) && (arr2.length !== 0)) {

    if (arr1[0] < arr2[0]) {
      result.push(arr1.shift());
    } else {
      result.push(arr2.shift());
    }
  }
  return result.concat(arr1).concat(arr2);
}

function mergeSort(arr) {
  if (arr.length <= 1) {
    return arr;
  }
  let mid = Math.round(arr.length / 2) ;
  let leftSide = mergeSort(arr.slice(0, mid));
  let rightSide = mergeSort(arr.slice(mid, arr.length));

  return mergeSortHelper(leftSide, rightSide);
}

// mergeSortHelper([1,2], [3,4]);
//
// mergeSort([1,3432,4,5,6,3,2]);


function subsets(arr) {
  if (arr.length === 0) {
    return [[]];
  }

  let first = arr.shift();
  let prevStep = subsets(arr);
  let callback = function(el) {
    return el.concat([first]);
  };
  return prevStep.concat(prevStep.map(callback));
}


// subsets([1,2,3]);

class Cat {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }

  cuteStatement() {
    return console.log(`${this.owner} loves ${this.name}`);
  }

  meow() {
    console.log(`${this.name} says meooooow`);
  }

}
//
// Cat.prototype.cuteStatement = function () {
//     return console.log(`${this.owner} loves ${this.name}`);
//   };

let garfield = new Cat("garfield", "dude");

console.log(garfield.name);

garfield.cuteStatement();
garfield.meow();
















//
