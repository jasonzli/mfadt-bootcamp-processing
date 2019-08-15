import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

OpenCV opencv;
Rectangle[] faces;

Capture video;
PImage canny;

void setup() {
  size(640,480);
  video = new Capture(this,640,480);
  
  opencv = new OpenCV(this, video.width,video.height);
  

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  
  video.start();
}

void draw() {
  if (video.available()){
    video.read();
  }
  
    opencv.loadImage(video);
  image(video, 0, 0);
  
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}
