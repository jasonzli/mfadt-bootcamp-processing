import processing.video.*;

Capture video;
//color trackColor;
float threshold = 80;
float motionX = 0;
float motionY = 0;
  
float lerpX = 0;
float lerpY = 0;


PImage prev;
 
void setup(){
  size(640,480);
  frameRate(100);
  String[] cameras = Capture.list();
  printArray(cameras);
  video  = new Capture(this, width, height);
  video.start();
  //trackColor = color(255,0,0);
  prev = createImage(640,480,RGB);
  
}
void captureEvent(Capture c) {
  prev.copy(video,0,0,video.width,video.height,0,0,prev.width,prev.height);
  prev.updatePixels();
  c.read();
}
void draw(){
  video.loadPixels();
  prev.loadPixels();
  //image(video,0,0);
  
  
  float avgX = 0;
  float avgY = 0;
  
  int count = 0;
  
  loadPixels();
  for(int x = 0; x < video.width; x++){
    for(int y = 0; y<video.height; y++){
      int loc = x+y * video.width;
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      color prevColor = prev.pixels[loc];
      float r2 = red(prevColor);
      float g2 = green(prevColor);
      float b2 = green(prevColor);
      
      float d = distSq(r1,g1,b1,r2,g2,b2);
      
      if(d>threshold * threshold){
        avgX += x;
        avgY += y;
        count++;
        pixels[loc] = color(255);
      }else{
        pixels[loc] = color(0);
      }
    }
  }
  
  updatePixels();
  
  if(count>200){
    motionX = avgX / count;
    motionY = avgY / count;
  }
    lerpX = lerp(lerpX, motionX,0.1);
    lerpY = lerp(lerpY, motionY,0.1);
    fill(255,0,244);
    strokeWeight(4.0);
    stroke(0);
    ellipse(lerpX, lerpY, 36, 36);
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2){
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1);
  return d;
}

//void mousePressed(){
//  int loc = mouseX+mouseY*video.width;
//  trackColor = video.pixels[loc];
//}
