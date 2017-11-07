Function.prototype.inherits = function(SuperClass) {
  function Surrogate() {}
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

//
function MovingObject () {}
MovingObject.prototype.move = function(){console.log("move");};

function Ship () {}
Ship.inherits(MovingObject);
Ship.prototype.sayShip = function(){console.log("ship");};

function Asteroid () {}
Asteroid.inherits(MovingObject);
Asteroid.prototype.color = function() {console.log("RED");};


const mo = new MovingObject();
const sh = new Ship();
const as = new Asteroid();

as.color();
mo.move();
sh.sayShip();

// ===========================================================

Function.prototype.inherits = function(SuperClass) {
  this.protoype = Object.create(SuperClass.prototype);
  this.prototype.constructor = this;
};
