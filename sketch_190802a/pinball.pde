class Ball{
  PVector position,direction;
  float speed,bodywidth,bodyheight;
  Paddle p1,p2;
  
  
  
  Ball(PVector _position,PVector _direction, float _speed, float _bodywidth,
      float _bodyheight, Paddle _p1, Paddle _p2){
    position = _position;
    direction = _direction;
    speed = _speed;
    bodywidth = _bodywidth;
    bodyheight = _bodyheight;
    p1 = _p1;
    p2 = _p2;
  
  }
  
  void flipH(){
    direction.x = -direction.x+ random(-0.1,0.1);
    direction.x = constrain(direction.x,-1,1);
   print(direction.x);
  }
  
  void flipV(){
    direction.y = -direction.y + random(-0.2,0.2);
    direction.y = constrain(direction.y,-1,1);
  }
  
  void move(){
    
    float newX = position.x + speed*direction.x*.5;
    float newY = position.y + speed*direction.y*.5;
    
    
    
    if ((newX < 0 || newX >= width))
    {
      flipH();
    }
     if ((newY < 0 || newY > height)){
      flipV();
    }
    

    
    if (p1.checkCollision(this) || p2.checkCollision(this))
    {
        flipH();
    }
    
    
    
    position.x = position.x + speed*direction.x;
    position.y = position.y + speed*direction.y;
  }
  
  void render(){
    
    fill(0);
    stroke(0);
    ellipse(position.x,position.y,bodywidth,bodyheight);
  }
}


class Paddle{
  PVector position;
  float speed,bodywidth,bodyheight;
  
  // Paddle object = new Paddle (PVector(2,4), 4, 5,10);
  Paddle(PVector _position, float _speed, float _bodywidth,float _bodyheight){
    position = _position;
    speed = _speed;
    bodywidth = _bodywidth;
    bodyheight = _bodyheight;
  }
  
  void render(){
    fill(0);
    stroke(0);
    rect(position.x,mouseY,bodywidth,bodyheight);
  }
  
  //THIS IS A MAJOR TODO. IT DOES NOT WORK
  //checks if target is within paddle
  boolean checkCollision(Ball target){
    
    boolean collided = false;
    
    if ((target.position.x-0.5*target.bodywidth > position.x && target.position.x+0.5*target.bodywidth < position.x+bodywidth) && 
        (target.position.y-0.5*target.bodyheight > position.y && target.position.y+0.5*target.bodyheight < position.y+bodyheight))
    {
      return true;
    
    }
    else return false;
    
  }
  
  
  //Make sure to constrain with vertical direction in draw function
  void moveUp(){
    position.y -= speed;
    position.y = constrain(position.y,0, height-bodyheight);
  }
  
  void moveDown(){
    position.y += speed;
    position.y = constrain(position.y,0, height-bodyheight);
  }
  
}
