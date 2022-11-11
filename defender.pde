private class defenders extends person
{
  PImage defaultimg;
  PImage leftimg ;
  PImage rightimg  ;
  PImage currentimg ;

  
  defenders( float x, float y, float xt, float yt)
  {
    super(x,y,xt,yt);   
    defaultimg = loadImage("defaultimg.png");//loads in all the images
    leftimg = loadImage("leftimg.png");
    rightimg = loadImage("rightimg.png");
    currentimg = defaultimg ;
  }
  void update()//updates the image of the defender
  {
    render();
  }
 
  void render()
  {
    imageMode(CENTER);// this makes sure that the image's coordinates are centered
    image(currentimg,x,y,100,100);//draws image
  }
  
  void move()
  {
     if (keyCode== LEFT)
     {
       x = x - xt;// moves inage to the left
       currentimg = leftimg;// changes image to turn right
     }
     else if (keyCode == RIGHT)
     {
       x = x+ xt;// moves image to the right
       currentimg = rightimg;// makes image look like it is turning right
     }
     else
     {
       currentimg = defaultimg;
     }
  }
  
  void collisiondraw()
  {
    fill(255,0,0);
    rect(this.x-50,this.y-50,100,100);//draws the attacker killing the defender
  }
  
  boolean collision(attackers other)
  {
    return(abs(this.x - other.x)<30 && abs(this.y - other.y)<30);// sees if two objects clash
  }
}
