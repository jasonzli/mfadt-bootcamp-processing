float[] x,y;


void setup(){
  size(800,800);
  background(255);
}


void draw(){
  drawShape(10, 10, 500, 400, 4, 3);
}


void drawNoiseRect(int x, int y, int w, int h, float intensity){
  float noiseScale = intensity;
  
  int px,py,nx,ny;
  
  px = x;
  py = y;
  
  //adjust vertical position
  for (int i = 0; i < h; i++){
      py = py+1;
      for (int j = 0; j < w ; j++){
        
      float noiseVal = noise(noiseScale);
      //);
      stroke(random(125,noise(noiseScale*py)));
        px= px+1;
        line(px, py, px+1, py);
  
      }
      px = x;
    }
  
}

void drawShape (float x, float y, float width, float height, float pieces, float spacing){
  fill(0);
  strokeWeight(spacing);
  drawNoiseRect((int)x,(int)y,(int)width,(int)height,.3);
  
  
  //calculate square size
  float square_size = height >= width ? width : height;
 
 
  //divide the whole thing into two pieces
  float bar_width =  height/2/pieces;
  
  //how many loops 
  int loopCount = ceil((height/2/bar_width));
  
  stroke(255);
  fill(255);
  
  //draw line from the center
  //line (x,y+height/2,x+width,y+height/2);
  
  //draw from center
  for (int i = 0;i < loopCount;i++){
    stroke(255);
    //this should be the center line
    
    float xToCenter = x+width/2;
    float yToCenter = y+height/2;
    
    //down from center
    float height_mod = height/2+bar_width*i;
    line(x,y+height_mod,xToCenter-bar_width*i,y+height_mod);
    line(xToCenter+bar_width*i,y+height_mod,x+width,y+height_mod);
    
    //up from center
    height_mod = height/2-bar_width*i;
    line(x,y+height_mod,xToCenter-bar_width*i,y+height_mod);
    line(xToCenter+bar_width*i,y+height_mod,x+width,y+height_mod);
    
    //right from center
    
    float width_mod = width/2+bar_width*i;
    line(x+width_mod,y,x+width_mod,yToCenter-bar_width*i);
    line(x+width_mod,yToCenter+bar_width*i,x+width_mod,y+height);
    
    //left from center
    
    width_mod = width/2-bar_width*i;
    line(x+width_mod,y,x+width_mod,yToCenter-bar_width*i);
    line(x+width_mod,yToCenter+bar_width*i,x+width_mod,y+height);
  }
  
  
}
