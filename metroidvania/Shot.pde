//


class Shot
{
  //position
  float xPos, yPos;
  //speed
  float xSpd, ySpd;
  //timer
  int timer;
  public Shot(float x, float y, float speed,int t)
  {
  xPos = x;
  yPos = y;
  //xSpd = speed;
  //ySpd = speed;
  
  timer = t;
//Determine speed based on vector subtraction
  xSpd = x-xPos;
  ySpd = y-yPos;
   
//Divide speeds based on speed variable
  xSpd /= dist(x,y,p.playerX,p.playerX)/speed;
  ySpd /= dist(x,y,p.playerY,p.playerY)/speed;
  }
  
  
    
    void moveAndDraw()
    {
      xPos += xSpd;
      yPos += ySpd;
      
      fill(100);
      circle(xPos+xOffset,yPos+yOffset,10);
    }
}
