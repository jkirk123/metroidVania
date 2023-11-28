class Key
{
  float xPos, yPos;
  int map;
  
  
  boolean grabbed;
  
  public Key(int M,float X, float Y )
  {
  xPos = X;
  yPos = Y;
  map = M;
  grabbed = false;
  }
  
  void drawKey()
  {
    if(map != currentMap || grabbed)
    return;
    
    if(int(dist(p.playerX+xOffset,p.playerY+yOffset,(xPos*blockSize) + xOffset,(yPos*blockSize)+ yOffset)/blockSize) > scrollXDist/blockSize)
   {
     return;
   }
    
    
    image(Keyi, xPos*blockSize + xOffset, yPos*blockSize + yOffset);
  }
}
