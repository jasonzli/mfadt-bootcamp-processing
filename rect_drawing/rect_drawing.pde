// fill() and stroke() apply to everything that follows
// them in draw. But they can be changed at any point.

void setup() {
  size(500, 500); // 500 by 500 canvas
  noLoop(); // only draw() once
}

void draw() {
  background(255); // white background
  
  fill(255, 0, 0); // red fill
  stroke(0, 255, 0); // green outline
  ellipse(200, 200, 60, 60); // ellipse with red fill and green outline
  
  fill(0, 0, 255); // blue fill
  stroke(0, 0, 0); // black outline
  ellipse(400, 400, 60, 60); // ellipse with blue fill and black outline
  
  fill(0, 255, ); // blue fill
  stroke(240, 0, 0); // black outline
  ellipse(400, 40, 60, 60); // ellipse with blue fill and black outline
}
