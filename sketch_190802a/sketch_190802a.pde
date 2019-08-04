float px = 250;
float py = 250;
float cx,cy;
float pWeight = 5;
  Paddle p1;
  Paddle p2;
  Ball ball;  

void setup(){
  size(500,500);
  background(255);
  PVector p1Start = new PVector(10,250);
  PVector p2Start = new PVector(460,250);
  PVector ballStart = new PVector(250,250);
  PVector randDirection = new PVector(random(-1,1),random(-1,1));
  p1 = new Paddle(p1Start,10,10,50);
  p2 = new Paddle(p2Start,10,10,50);
  ball = new Ball(ballStart,randDirection,5,10,10,p1,p2);
}

void keyPressed(){
  if (key == 'w'){
    p1.moveUp();
  }
  if (key == 'i'){
    p2.moveUp();
  }
  if (key == 's'){
    p1.moveDown();
  }
  if (key == 'k'){
    p2.moveDown();
  }
  print(key);
  
}


void draw(){
  
  noStroke();
  
  fill(255);
  rect(0,0,width,height);
  
  ball.move();
  ball.render();
  
  p1.render();
  p2.render();
  
  
  
  //float r = map(cx, 0, width, 0,250);
  //float g = map(cy, 0, height, 0,250);
  //float b = 255*tan(cx*cy);
  //float newWeight = lerp(pWeight,200*cos(mouseX*mouseY)*cos(mouseX*mouseY),0.15);
  
  //cx = constrain(px + random(-20,20), mouseX-20 , mouseX+20);
  
  //cy = constrain(py + random(-20,20), mouseY-20 , mouseY+20);
  
  //noFill();
  //stroke(r,g,b);
  //stroke(1);
  //strokeWeight(newWeight);
  
  
  //line(px,py,cx,cy);
  
  //px = cx;
  //py = cy;
}
