float[] x,y;


void setup(){
  size(800,800);
  background(255);
}


void draw(){
  drawShape2(200, 200, 400, 400, 5, 1);
}

void drawShape2 (float x, float y, float width, float height, float pieces, float spacing){
  fill(0);
  strokeWeight(spacing);
  rect(x,y,width,height);
  
  
  //calculate square size
  float square_size = height >= width ? width : height;
  
  //divide the whole thing into two pieces
  float bar_width =  height/2/pieces;
  
  //how many loops 
  int loopCount = (int)(height/2/bar_width);
  
  stroke(255);
  fill(255);
  
  //draw line from the center
  line (x,y+height/2,x+width,y+height/2);
  
  //draw down from center
  for (int i = 0;i < loopCount;i++){
    stroke(255);
    float height_mod = height/2+bar_width*i;
    float xToCenter = x+width-square_size;
    line(x,y+height_mod,x+xToCenter-bar_width*i,y+height_mod);
    line(x+xToCenter+bar_width*i,y+height_mod,x+width,y+height_mod);
  }
  //draw up from center
  for (int i = 0;i < loopCount;i++){
    stroke(255);
    float height_mod = height/2-bar_width*i;
    float xToCenter = x+width-square_size;
    line(x,y+height_mod,x+xToCenter-bar_width*i,y+height_mod);
    line(x+xToCenter+bar_width*i,y+height_mod,x+width,y+height_mod);
  }
  
  
  //draw right from center
  for (int i = 0;i < loopCount;i++){
    stroke(255);
    float width_mod = width/2+bar_width*i;
    float height_mod = height-square_size;
    line(x+width_mod,y,x+width_mod,y+height_mod-bar_width*i);
  }
  /*
  //draw left
   for (int i = 0;i < loopCount;i++){
    stroke(255);
    float width_mod = width/2-bar_width*i;
    line(x+width_mod,y,x+width_mod,y+height);
  }
  */
  
}

void drawShape(float x1, float x2, float y1, float y2, 
               float a1, float a2, float b1, float b2,
               float width, float spacing){
    
                 
                 
}
