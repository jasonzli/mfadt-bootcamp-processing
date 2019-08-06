

void setup(){
  size(800,800);
  background(234,225,211);
  
}


void draw(){
  fill(255);
  //clearing the canvas
  //rect(0,0,width,height);
  
  /*
  This particular method first draws a rectangle and then applies solid white lines on top
  because it involves hundreds, thousands of line() calls, it is slow
  */
  drawShape(10, 10, 300, 400, 5 , 1);
  
  
}




//this function draws the noise background for the image
private void drawNoiseRect(int x, int y, int w, int h, float intensity){
  
  //not used
  float noiseScale = intensity;
  
  //color in black
  fill(0);
  stroke(0);
  strokeWeight(1);//single pixel width
  
  //previous x,y and new x,y
  int px,py,nx,ny;
  
  px = x;
  py = y;
  
  /* This loop will start filling in a square with random black intensity
  *  It does this by starting at the top left of the square and drawing 1 pixel long lines
  *  toward the x+width position. 
  */
  //this value i is the vertical position, which approaches h
  for (int i = 0; i < h; i++){
      
      ny = py+1;
        
      //
      for (int j = 0; j < w ; j++){
        nx= px+1;
        
        //this is a positional modifier to make the lines 'fuzzy'
        float strokeMod = random(-0.6,0.6);
        
        //noise value based on position within 
        //look up noise() documentation to understand Perlin noise
        float noiseVal = noise(px*noiseScale,py*noiseScale);
        
        //this makes the stroke of a random strength between the noise and 1,
        strokeWeight(random(noiseVal,1));
       
        
        line(px, py, nx+strokeMod, ny+strokeMod);
        
        px = nx;
      }
      
      px = x;//reset the x value for the next line
      py = ny;//new y, as you draw onto the next line of the rectangle
    }
  
}


/*
This function takes an x position, a y position, a width, height,
pieces (how many "divisions" ), and a spacing (line/stroke weight);
*/
void drawShape (float x, float y, float width, float height, float pieces, float spacing){
  fill(0);
  fill(234,225,211);
  rect(x,y,width,height);
  //draw the background rectangle first
  //send the values that 'the shape' requires
  drawNoiseRect((int)x,(int)y,(int)width,(int)height,.003);
  
  //calculate square size
  float square_size = height >= width ? width : height;
 
  //divide the whole thing by how many pieces and then use that value as the bar width
  // bar_width is also the distance between lines, which is what I am using here
  float bar_width =  height/2/pieces;
  
  //how many loops, which is the division of the height by how many bars can fit
  //floor() rounds all decimal values down);
  int loopCount = floor((square_size/2/bar_width));
  
  stroke(255);
  fill(255);
  strokeWeight(spacing);
  
  //draw from center method draws lines
  //loop to the number of how many bars we will need
  for (int i = 0;i < loopCount;i++){
    stroke(255);
    
    //distance from edges to middle
    float xToCenter = x+width/2;
    float yToCenter = y+height/2;
    
    /*feel free to comment out any one of these following 4 sections to see how they work
    They draw from the edge towards center then from the middle+offset 
    to the opposite edge. 
    
    Like this:
    
    edge          edge
    |---       ---|
    |-----   -----|
    |-------------|
    |-----   -----|
    |---       ---|
    
    height_mod is the heigh modifier, it tracks how far off the center we are in a particular loop
    bar_width*i is the off set from center based on how many bars we've drawn

    */
    
    /*
    the center line is created in the i = 0 condition, 
    where all lines meet in the middle like Maren Morris in that Zedd song
    */
    
    //Draws down from center line
    float height_mod = height/2+bar_width*i;
    line(x,y+height_mod,xToCenter-bar_width*i,y+height_mod);
    line(xToCenter+bar_width*i,y+height_mod,x+width,y+height_mod);
    
    //Draws up from center line
    height_mod = height/2-bar_width*i;
    line(x,y+height_mod,xToCenter-bar_width*i,y+height_mod);
    line(xToCenter+bar_width*i,y+height_mod,x+width,y+height_mod);
    
    //Draws right from center line
    float width_mod = width/2+bar_width*i;
    line(x+width_mod,y,x+width_mod,yToCenter-bar_width*i);
    line(x+width_mod,yToCenter+bar_width*i,x+width_mod,y+height);
    
    //Draws left from center line
    width_mod = width/2-bar_width*i;
    line(x+width_mod,y,x+width_mod,yToCenter-bar_width*i);
    line(x+width_mod,yToCenter+bar_width*i,x+width_mod,y+height);
    
    /*
    then it loops again but the bar_width*i will be a larger value and the lines will
    be further away
    
    */
  }
  
  
}
