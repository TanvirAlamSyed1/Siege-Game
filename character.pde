abstract class person
{
  float x;// coordinates
  float y;
  float xt;
  float yt;
  
  //constructor
  
  person(float x , float y, float xt, float yt)
  {
    this.x = x; // taking in the perameters
    this.y = y;
    this.xt = xt;
    this.yt = yt;
  }
  
  abstract void update();

  
  abstract void render();

  
}
