const mo = require('moving_object.js');

function Bullet() {
  this.prototype = Object.create(mo);
  this.prototype.constructor = this;

}
