private class attackers extends person// this means that the class can't be editied outside 
{
  //attributes
  PImage image1,image2,image3,image4;// image stored here
  int oppositeDir = 1;// forward 
  int counter = 0;
  //https://www.clipartmax.com/middle/m2H7H7d3m2G6Z5K9_sprite-sheet-climb-cycle-shaded-72dpi-sprite-character-climb/
  
  
  //constructor
  attackers()
  {
    super(int(random(220,width-200)),700,0,2);// random location loading
    image1 = loadImage("image1.png");
    image2 = loadImage("image2.png");
    image3 = loadImage("image3.png");
    image4 = loadImage("image4.png");
  }
  
  void update()
  {
    move();
    render();
  }
  
  void move()
  {
    if (y <= 0)// if alien hits left wall
    {
      y = height-50;// resets the image
      x = int( random(220,width-200));// reloads at a random image
    }
    this.y = this.y-this.yt;
  }
  void render()
  {
    PImage[] listofimage =new PImage[4];    
    listofimage[0] = image1;
    listofimage[1] = image2;
    listofimage[2] = image3;
    listofimage[3] = image4;
    if (counter >=0 && counter <= 5)// if timer is between 0-10
    {
      image (listofimage[0],x,y,100,100);// draw image 1
    }
    else if (counter > 5 && counter <= 15)// if timer is between 10-20
    {
      image(listofimage[1],x,y,100,100);// draw image 2
    }
    else if (counter > 15 && counter <= 25)// counter is between 20-30
    {
      image(listofimage[2],x,y,100,100);// draws image 3
    }
    else if (counter > 25 && counter <= 30)// counter is between 20-30
    {
      image(listofimage[3],x,y,100,100);// draws image 3
    }    
    else
    {
      oppositeDir = -oppositeDir;// goes opposite direction
    }
    counter = counter + oppositeDir;//makes counter go backwards
      
  }
  
  boolean collision(ball other)
  {
    return(abs(this.x - other.x)<20 && abs(this.y - other.y)<20);// sees if two objects clash
  }
  
}
