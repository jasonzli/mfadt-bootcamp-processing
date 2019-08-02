float px = 250;
float py = 250;
float cx,cy;

void setup(){
  size(500,500);
  background(255);
}

void draw(){
  
  noStroke();
  fill(255,50);
  rect(0,0,width,height);
  
  float r = map(cx, 0, width, 0,250);
  float g = map(cy, 0, height, 0,250);
  float b = 255*tan(cx*cy);
  
  cx = constrain(px + random(-20,20), mouseX-20 , mouseX+20);
  
  cy = constrain(py + random(-20,20), mouseY-20 , mouseY+20);
  
  noFill();
  stroke(r,g,b);
  strokeWeight(20*cos(cy)*cos(cy));

  
  line(px,py,cx,cy);
  
  px = cx;
  py = cy;
}
