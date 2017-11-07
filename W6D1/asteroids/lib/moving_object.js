// MovingObject.prototype.move
// MovingObject.prototype.draw(ctx)
// MovingObject.prototype.isCollidedWith(otherMovingObject)

function MovingObject(arg) {
  this.pos = arg.pos;
  this.vel = arg.vel;
  this.radius = arg.radius;
  this.color = arg.color;
}

MovingObject.prototype.draw = function(){
  const canvasEl = document.getElementById("canvas");
  canvasEl.width = 500;
    canvasEl.height = 500;

    const ctx = canvasEl.getContext("2d");
   ctx.fillStyle = this.color;
   ctx.beginPath();
   ctx.arc(
     this.pos[0],
     this.pos[1],
     this.radius,
     0,
     2 * Math.PI
   );

   ctx.fill();


};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

  console.log(this.pos);
  this.draw();
};



  const mo = new MovingObject(
    { pos: [100, 100],
      vel: [100, 100],
      radius: 50,
      color: "#00FF00"}
  );

  mo.draw();

  setInterval(() => {mo.move();}, 500);
