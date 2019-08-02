float increment = 0;

void setup() {
  size (500,500);
  background(255);
  noStroke();
  frameRate(120);
}

void draw(){
 
 fill (255,255,255,20);
 rect(0,0,500,500);
 if (mousePressed){
   fill (255*sin(increment),255*cos(increment),255*tan(increment*2));
   ellipse(mouseX,mouseY,60,60);
 }
 increment += 0.01;
}
