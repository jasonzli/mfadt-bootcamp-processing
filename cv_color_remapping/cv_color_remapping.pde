import processing.video.*;

Capture video;
PImage picture;

float threshold = 80;
int stage = 0;

color redValue;
color greenValue;
color blueValue;

void setup(){
    size(640,480);
    String[] cameras = Capture.list();
    printArray(cameras);
    video = new Capture(this,width,height);
    video.start();
    picture = loadImage("Picasso-1.jpg");
}
void captureEvent(Capture c) {
  c.read();
}
void draw(){
  
  switch(stage){
    case 0:
      getRed();
      break;
    case 1:
      getGreen();
      break;
    case 2:
      getBlue();
      break;
    case 3:
      drawPainting();
      break;   
  }
}

void getRed(){
  video.loadPixels();
  image(video,0,0);
}

void getGreen(){
  video.loadPixels();
  image(video,0,0);
}

void getBlue(){
  video.loadPixels();
  image(video,0,0);
}

void drawPainting(){
}
//get the base red and see how much that base red has moved and apply that to all colors.
void mousePressed(){
  int loc = mouseX + mouseY * video.width;
  color currentColor = video.pixels[loc];
  switch(stage){
    case 0:
      redValue = color (red(currentColor),green(currentColor),blue(currentColor));
      stage++;
      break;
    case 1:
      greenValue = color (red(currentColor),green(currentColor),blue(currentColor));
      stage++;
      break;
    case 2:
      blueValue = color (red(currentColor),green(currentColor),blue(currentColor));
      stage++;
      break;
    case 3:
      drawPainting();
      break;   
  }
}
