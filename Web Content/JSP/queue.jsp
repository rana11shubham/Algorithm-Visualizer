<%
String email=(String)session.getAttribute("email");
if(email==null)
{
	response.sendRedirect("index.jsp");
}
else
{	
%>

<!DOCTYPE html>
<html>
  

<head>
    <title>Queue</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/boxes.css" />

 <script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.ui.touch-punch.min.js"></script>
<script src="js/jquery.alerts.js"></script> 
<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />

        <script src="js/LinkedList.js"></script>
    <script src="js/Queue.js"></script>
	<style>
	body {
        background-color:WhiteSmoke ;
} 
	</style>
    <script >
      queue = new Queue();
      startingX = 20;
      rectWidth = 40;
      rectHeight = 20;

      function startOver() {
          queue = new Queue();
          startingX = 20;
          rectWidth = 40;
          rectHeight = 20;
          draw();
      }

      function draw() {
          var canvas = document.getElementById('canvas');
          var context = canvas.getContext("2d");

          // Reset size will clear the canvas, but not for IE9
          canvas.width = window.innerWidth - 20;
          canvas.height = window.innerHeight - 180;
          context.clearRect(0, 0, canvas.width, canvas.height); // For IE 9

          context.font = "14px sans-serif";
          context.strokeStyle = "#100"; // Set a pen color

          if (queue.isEmpty()) {
              context.fillText("queue is empty", 10, 15);
          }
          else {
              x = startingX;
              y = 60;

              context.fillText("head", x - 15, 15);
              drawArrowLine(context, x + 10, 20, x + 10, y);

              var size = queue.getSize();
              var list = [];
              for (var i = 0; i < size; i++) {
                  list[i] = queue.dequeue();
                  queue.enqueue(list[i]);
              }

              for (var i = 0; i < size; i++) {
                  context.fillText(list[i] + "", x + 15, y + 15);
                  context.rect(x, y, rectWidth, rectHeight);
                  x += rectWidth;
              }
              context.fillText("tail", x + 10, 15);
              drawArrowLine(context, x + 15, 20, x, y);
          }

          context.stroke();
      }

      function dequeue() {
          if (queue.isEmpty()) {
              jAlert("The queue is empty");
          }
          else {
              queue.dequeue();
              startingX += rectWidth;
              draw();
          }
      }

      function enqueue() {
          var value = document.getElementById('value').value.trim();
          if (value == "") {
              jAlert("No value entered");
          }
          else {
              queue.enqueue(value);
          }

          draw();
      }

      function drawArrowLine(context, x1, y1, x2, y2) {
          context.moveTo(x1, y1);
          context.lineTo(x2, y2);

          // find slope of this line
          var slope = (y1 - y2) / (x1 - x2);

          var arctan = Math.atan(slope);

          // This will flip the arrow 45 off of a
          // perpendicular line at pt x2
          var set45 = 1.57 / 2;

          // arrows should always point towards i, not i+1
          if (x1 < x2) {
              // add 90 degrees to arrow lines
              set45 = -1.57 * 1.5;
          }

          // set length of arrows
          var arrlen = 15;

          // draw arrows on line
          context.moveTo(x2, y2);
          context.lineTo(x2 + Math.cos(arctan + set45) * arrlen,
                  y2 + Math.sin(arctan + set45) * arrlen);

          context.moveTo(x2, y2);
          context.lineTo(x2 + Math.cos(arctan - set45) * arrlen,
                  y2 + Math.sin(arctan - set45) * arrlen);
      }
    </script>
  

</head>



  <body onload="draw()" onresize="draw()">   
    <h3 style="text-align:center; font: bold">Queue Animation</h3>
    <h4 align="center">
      Usage: Enter a value and click the Enqueue button to append the value into the tail of the queue.<br/>
      Click the Dequeue button to remove the element from the head of the queue. Click the Start Over button to start over.
		</h4>
	<div align ="center">
  <canvas id="canvas" width="400" height = "400" style="border:solid 1px #000000;"></canvas>
  </div>
    
    <div style="text-align: center; margin-top: 1em">
      <span style="border: 1px solid #37826C; padding: 3px">
        Enter a value: <input type="text" value="" id="value" style="width: 3em; text-align: right">
        <button type="button" class="button" onclick="enqueue()">Enqueue</button>
      </span>
      <button type="button" class="button" onclick="dequeue()">Dequeue</button>
      <button type="button" class="button" onclick="startOver()">Start Over</button>
    </div>
  </body>

</html>

<%
}
%>