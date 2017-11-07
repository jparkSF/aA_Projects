function sum() {
  let output = 0;
  for(let i = 0; i < arguments.length; i++) {
    output += arguments[i];
  }

  return output;
}

// sum(1, 2, 3, 4) === 10
// sum(1, 2, 3, 4, 5) === 15

function sum2(...nums) {
  let output = 0;
  for(let i = 0; i < nums.length; i++) {
    output += nums[i];
  }
  return output;
}

// sum(1, 2, 3, 4) === 10
// sum(1, 2, 3, 4, 5) === 15

// =============================================

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

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true


Function.prototype.myBind = function(ctx){
  const value = Array.from(arguments).slice(1);
  let something = this;

  //return (arg) => {this.apply(ctx, value.concat(arg))};

  return function(){
    return something.apply(ctx, value.concat(Array.from(arguments)));
  };
};
// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true



// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true

// =============================================


function curriedSum(numArgs) {
  const numbers = [];

  return function _curriedSum(...num) {

    numbers.concat(num);

    if(numbers.length === numArgs) {
      let total = 0;
      numbers.forEach((el) => {
        total += el;
      });
      return total;
    } else {
      return _curriedSum;
    }

  };
}


// const add = curriedSum(4);
// add(5)(30)(20)(1); // => 56

// =============================================


Function.prototype.curry = function(numArgs){
  const number = [];
  let stuff = this;
  return function _curry(...num) {
    number.push(num);

    if (number.length === numArgs){
      return stuff(number);
    } else {
      return _curry;
    }
  };
};


const fnc = function(...args){
  let output = 0;
  let arr = Array.from(args[0])

  arr.forEach((el) => output += parseInt(el));
  console.log(output);

};

const fnc = function(args){
  let output = 0;
  let arr = args;  

  arr.forEach((el) => output += parseInt(el));
  console.log(output);

};


fnc.curry(3)(1)(2)(4); //[1,3,2]
