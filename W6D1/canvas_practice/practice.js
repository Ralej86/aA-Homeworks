document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById('mycanvas');
  canvasEl.height = 500;
  canvasEl.width = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = 'yellow';
  ctx.linewidth = 10;
  ctx.stroke();
  ctx.fillStyle = "gray";
  ctx.fill();

  ctx.clearRect(250, 250, 50, 50);
});
