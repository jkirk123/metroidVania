//


class Shot
{
  //position
  float xPos, yPos;
  //speed
  float xSpd, ySpd;
  //timer
  int timer;
  
  
  boolean ShotOver;
  public Shot(float x, float y, float speed,int t)
  {
  xPos = x;
  yPos = y;
  //xSpd = speed;
  //ySpd = speed;
  
  timer = t*1000+ millis();
//Determine speed based on vector subtraction
  xSpd = x-xPos;
  ySpd = y-yPos;
   
//Divide speeds based on speed variable
  xSpd /= dist(x,y,p.playerX,p.playerY)/speed;
  ySpd /= dist(x,y,p.playerX,p.playerY)/speed;
  }
  
  
    
    void moveAndDraw()
    {
      xPos += xSpd;
      yPos += ySpd;
      
      fill(100);
      circle(xPos+xOffset,yPos+yOffset,10);
      
      if(millis() > timer)
      ShotOver = true;
    }
}
