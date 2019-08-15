import gab.opencv.*;
import processing.video.*;

Capture video;
PImage canny;
OpenCV opencv;

void setup() {

  video = new Capture(this, 640, 480);
  video.start();
  size(640, 480);
  opencv = new OpenCV(this, video.width, video.height);

}

void draw() {

  if(video.available()) {
    video.read();
  }

  image(video,0,0);
  
  background(0);
  opencv.loadImage(video);
  opencv.findCannyEdges(50,75);
  canny = opencv.getSnapshot();
  
}
