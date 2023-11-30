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
  
  xSpd = x-p.playerX;
  ySpd = y-p.playerY;
  
   
//Divide speeds based on speed variable
  xSpd /= dist(x,y,p.playerX,p.playerY)/speed;
  ySpd /= dist(x,y,p.playerX,p.playerY)/speed;
  }
  
  
    
    void moveAndDraw()
    {
      xPos -= xSpd;
      yPos -= ySpd;
      
      //fill(0,80);
      //noStroke();
      image(eyeShot,xPos-25+xOffset,yPos-25+yOffset);
      
      if(millis() > timer)
      ShotOver = true;
      
      if(dist(p.playerX,p.playerY,xPos,yPos) <  30)
      {
      p.checkForDeath(true);
      }
    }
}
