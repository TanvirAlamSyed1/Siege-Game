private class ball
{
  float x;// coordinates
  float y;
  float yt;
  ball (defenders other)// takes in the perameters and sets them to the bullet
  {
    this.x = other.x;
    this.y= other.y;
    this.yt = 10;

  }
  void update()//updates the ball and image and movement
  {
    render();
    move();
  }
  
  void move()
  {
    y = y + yt;// travels the ball
  }
  
  void render()//draw ball
  {
    fill(255);//makes ball white
    ellipse(x,y,50,50);//creates the ball
  }
  
}
