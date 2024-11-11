
// Variable that changes the circle width and height
int circleSize;
boolean drawTriangle = false; // Controls triangle drawing
boolean drawCircle = false;
 
// Define the vertices of the triangle relative to the click position
float x1 = -30, y1 = -30;  // Offset for first vertex
float x2 = -65, y2 = 45;   // Offset for second vertex
float x3 = 2, y3 = 45;     // Offset for third vertex
 
void setup() {
  size(800, 600);  // Set the size of the canvas
  background(255); // Set the background to white
}
 
void draw() {
  // Black circle outline
  stroke(0);
  strokeWeight(10);  // Thick outline
  fill(255, 30, 150, 20);
  circle(155, 130, 150);
 
  stroke(0); // Black circle outline
  strokeWeight(5); // Thin outline for smaller circle
  fill(100, 200, 255, 50);
  circle(350, 130, 80); // Smaller circle
 
  stroke(0); // Black triangle outline
  strokeWeight(5); // Thin outline for the triangle
  fill(100, 200, 255, 50);
  triangle(500, 99, 465, 173, 532, 173); // Static triangle
 
  // Check if the mouse is pressed to draw shapes dynamically
  if (mousePressed) {
    noStroke();
    fill(random(255), random(255), random(255), 150);  // Set random color
 
    if (drawCircle) {
      circle(mouseX, mouseY, circleSize); // Draw the circle
    }
    // Draw the triangle only if drawTriangle is true
    if (drawTriangle) {
      triangle(mouseX + x1, mouseY + y1, mouseX + x2, mouseY + y2, mouseX + x3, mouseY + y3);
    }
  }
}
 
void mouseReleased() {
  // Check if the mouse is inside the large circle
  if (mouseX > 80 && mouseX < 200 && mouseY > 55 && mouseY < 200) {
    circleSize = 150;
    drawCircle = true;
    drawTriangle = false;
  }
  // Check if the mouse is inside the smaller circle
  else if (mouseX > 310 && mouseX < 390 && mouseY > 91 && mouseY < 170) {
    circleSize = 80;
    drawCircle = true;
    drawTriangle = false;
  }
  // Check if the mouse is inside the triangle region and toggle drawTriangle
  else if (mouseX > 466 && mouseX < 527 && mouseY > 102 && mouseY < 170) {
    drawTriangle = true;
    println("Triangle toggle: " + drawTriangle);
    drawCircle = false;
  }
}
