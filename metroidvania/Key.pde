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
    
    
    image(Keyi, xPos*blockSize + xOffset, yPos*blockSize + yOffset);
  }
}
