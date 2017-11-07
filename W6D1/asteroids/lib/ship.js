const mo = require('moving_object.js');

function Ship() {
  this.prototype = Object.create(mo);
  this.prototype.constructor = this;

}
