const mo = require('moving_object.js');

function Asteroids() {
  this.prototype = Object.create(mo);
  this.prototype.constructor = this;

}
