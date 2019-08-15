import processing.video.*;

Capture video;
PImage picture;
PImage sizedPicture;
PVector Red =  new PVector(255,0,0);
PVector Green =  new PVector(0,255,0);
PVector Blue =  new PVector(0,0,255);
boolean drawn = false;
      
float threshold = 80;
int stage = 0;

color redValue;
PVector redDistance = new PVector(0,0,0);

color greenValue;
PVector greenDistance = new PVector(0,0,0);

color blueValue;
PVector blueDistance = new PVector(0,0,0);

void setup(){
  
    size(1280,840);
    String[] cameras = Capture.list();
    printArray(cameras);
    video = new Capture(this,width,height);
    video.start();
    picture = loadImage("Picasso-1.jpg");
    picture.resize(0,680);
    textSize(32);
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
  fill(0,0,0);
  noStroke();
  rect(10,20,550,40);
  
  fill(255,255,255);
  text("Please give me a red and click on it", 10, 60);
  
  noFill();
  
  strokeWeight(4);
  stroke(255,255,255);
  rect(mouseX-25,mouseY-25,50,50);
  
}

void getGreen(){
  video.loadPixels();
  image(video,0,0);
  fill(0,0,0);
  noStroke();
  rect(10,20,580,40);
  
  fill(255,255,255);
  text("Please give me a green and click on it", 10, 60);
  
  noFill();
  strokeWeight(4);
  stroke(255,255,255);
  rect(mouseX-25,mouseY-25,50,50);
}

void getBlue(){
  video.loadPixels();
  image(video,0,0);
  noStroke();
  fill(0,0,0);
  rect(10,20,580,40);
  
  fill(255,255,255);
  text("Please give me a blue and click on it", 10, 60);
  
  noFill();
  strokeWeight(4);
  stroke(255,255,255);
  rect(mouseX-25,mouseY-25,50,50);
  
}

void drawPainting(){
  fill(0,0,0);
  noStroke();
  rect(0,0,width,height);
  image(picture,40,150,picture.width,picture.height);
  //image(picture,600,150,picture.width,picture.height);
  
  //draw information text on screen

  fill(255,255,255);
  text("Wow! How did I do? Accurate? Press space to give me new colors", 10, 60);
  text("The original is on the left", 10, 120);
  
  //assess the image's values
  picture.loadPixels();
  if (!drawn);
  for (int x = 0; x < picture.width; x++){
    for (int y = 0; y < picture.height; y++){
      
      int loc = x+y * picture.width;
      color currentColor = picture.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      //float r2 = 2*r1 - red(redValue);
      //float g2 = 2*g1 - green(greenValue);
      //float b2 = 2*b1 - blue(blueValue);
      
      float r2 = map(r1, 0,255, 0, red(redValue)); 
      float g2 = map(g1, 0,255, 0, green(greenValue)); 
      float b2 = map(b1, 0,255, 0, blue(blueValue)); 
      //your color: x, y, z
      
      PVector v1 = new PVector
      (redDistance.x * r1/255,redDistance.y * r1/255, redDistance.z *r1/255);
      
      PVector v2 = new PVector
      (greenDistance.x * g1/255,greenDistance.y * g1/255, greenDistance.z *g1/255);
      
      PVector v3 = new PVector
      (blueDistance.x * b1/255,blueDistance.y * b1/255, blueDistance.z *b1/255);
      
      v1.add(v2.add(v3));
      
      PVector colorVector = v1;
//colorspace r: rx, ry, rz
//colorspace g: gx, gy, gz
//colorspace b: bx, by, bz

//(rx * x/255, ry * y/255, rz * z/255) + (gx * x/255, gy * y/255, gz * z/255) + (bx * x/255, by * y/255, bz * z/255)
//
      //PVector colorVector = new PVector(r1,g1,b1);
      //PVector redVector = new PVector (r1,0,0);
      //PVector greenVector = new PVector (0,g1,0);
      //PVector blueVector = new PVector (0,0,b1);
      //PVector.add(redVector,redDistance,redVector);
      //PVector.add(greenVector,greenDistance,greenVector);
      //PVector.add(blueVector,blueDistance,blueVector);
      
      //PVector.add(colorVector,redDistance,colorVector);
      //PVector.add(colorVector,greenDistance,colorVector);
      //PVector.add(colorVector,blueDistance,colorVector);
      
      //Take the subtraction between R and R', B and B', G and G' and then add that to the point
      stroke(constrain(colorVector.x,0,255),
             constrain(colorVector.y,0,255),
             constrain(colorVector.z,0,255));
      
      //other method is do specific rgb modifications
         //stroke(constrain(r2,0,255),
         //    constrain(g2,0,255),
         //    constrain(b2,0,255));
      
      //println(colorVector);
      point(600+x,150+y);
    }
  }
  
  picture.updatePixels();
  drawn = true;
}

void keyPressed(){
  if (key == ' ' ){
    stage = 0;
    fill(0,0,0);
    noStroke();
    drawn = false;
    rect(0,0,width,height);
  }
}

//get the base red and see how much that base red has moved and apply that to all colors.
void mousePressed(){
  
  int loc = mouseX + mouseY * video.width;
  color currentColor = video.pixels[loc];
  
  switch(stage){
    case 0:
      redValue = color (red(currentColor),green(currentColor),blue(currentColor));
      redDistance.set(red(currentColor),green(currentColor),blue(currentColor));
      print(redDistance);
      //PVector.cross(Red,redDistance,redDistance);
      //redDistance.limit(255);
      println(redDistance);//this is definitely the color but how do I convert it into 
      stage++;
      break;
    case 1:
      greenValue = color (red(currentColor),green(currentColor),blue(currentColor));
      greenDistance.set(red(currentColor),green(currentColor),blue(currentColor));     
      print(greenDistance);
      //PVector.cross(Green,greenDistance,greenDistance);
      //greenDistance.limit(255);
      println(greenDistance);
      stage++;
      break;
    case 2:
      blueValue = color (red(currentColor),green(currentColor),blue(currentColor));
      blueDistance.set(red(currentColor),green(currentColor),blue(currentColor));
      print(blueDistance);
      //PVector.cross(Blue,blueDistance,blueDistance);
      //blueDistance.limit(255);
      println(blueDistance);
      stage++;
      break;
    case 3:
      print(redDistance);
      print(greenDistance);
      println(blueDistance);
      drawPainting();
      break;   
  }
}
