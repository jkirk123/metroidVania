class Block
{


  //datata
  BlockType type;
  float blockX, blockY;
  float size;
  boolean pathable;
  boolean background;
  boolean seen = false;
  boolean Glow = false;
  
  int brightness;
  //badguy data
  int cooldown=0;
  int map;
  int range = 500;
  int waitTime = 000;
  int shotSpeed = 2;
  int shotDur= 10;
  
  // mathods
  public Block(char t, float x, float y, int m)
  {
    blockX = x;
    blockY = y;
    size = blockSize;
     map = m;
    pathable = true;
    Glow = false;
    type = setType(t);
    brightness = 0;
    
  }
  
  void tryToShoot()
   {
     waitTime = p.deathCount * 500;
     //timer distance map
     if(currentMap == map && dist(blockX,blockY,p.playerX,p.playerY) < range && millis() > cooldown)
     {
       cooldown = millis() + waitTime;
       arsenal.add( new Shot(xMiddle(),yMiddle(),shotSpeed,shotDur)); 
     }
     
   }

  private BlockType setType(char t)
  {
    switch(t)
    {
      
      case '#': pathable = false; return BlockType.WALL1;
      case '[': pathable = false; return BlockType.WALL2;
      case ']': pathable = false; return BlockType.WALL3;
      case '-': return BlockType.THIN;
      case 'D': return BlockType.DOOR;
      case 'F': return BlockType.FROGSTATUE;
      case 'L': return BlockType.LADDER;
      case '!': Glow = true; return BlockType.LANTERN;
      case 'T': return BlockType.TREE;
      case '.': return BlockType.HOLE;
      case '^': return BlockType.SPIKE;
      case 'X': Glow = true; return BlockType.FIRE;
      case 'B': return BlockType.BadGuy;
      default: return BlockType.NONE;
    }
    
    
    //return BlockType.NONE;
  }
  void setDark(float lightX, float lightY)
  {
  float X = blockX+ xOffset;
  float Y = blockY+ yOffset;
  //if(brightness == -1)
  brightness = int(dist(lightX+xOffset,lightY+yOffset,X,Y)/blockSize);
  //return;
   if(brightness > scrollXDist/blockSize)
    {
      return;
      //image(darkness, X, Y);
      
    }
    else if(brightness > (scrollXDist/blockSize)/1.5  )
    {
      fill(0,95);
      square(X, Y,blockSize);
      
    }
    else if(brightness > (scrollXDist/blockSize)/3  )
    {
      fill(0,50);
      square(X, Y,blockSize);
      
    }
    
    //brightness = 0;
  }
  

  void drawMe()
  {
    float X = blockX+ xOffset;
    float Y = blockY+ yOffset;
    if(type == BlockType.BadGuy)
    tryToShoot();
    
    for(Portal p: doors)
    {
      if( p.locked && p.originMap == currentMap && blockX == p.originX*blockSize && blockY == p.originY*blockSize )
      {
      image(DoorLocked, X, Y);
      
      return;
      }
    }
    if(brightness > scrollXDist/blockSize)
    {
      return;
    }
    
    
    
    //image(blockINone, blockX, blockY);
    if(type == BlockType.NONE)
    {
    
    image(blockINone, X, Y);
    }
    if(type == BlockType.TREE)
    {
    if(world.get(currentMap).blocks[int(blockX/blockSize)][int(blockY/blockSize)-1].type != BlockType.HOLE)
        {
          image(blockINone, X, Y);
        }  
    image(blockITREE, X-blockSize, Y-blockSize);
    }
    if(type == BlockType.FIRE)
    {
      if(world.get(currentMap).blocks[int(blockX/blockSize)][int(blockY/blockSize)-1].type != BlockType.HOLE)
        {
          image(blockINone, X, Y);
        }
    image(blockIFIRE,X,Y);
    
    }
    if(type == BlockType.WALL1)
    {
    image(blockI, X, Y);
    }
    if(type == BlockType.WALL2)
    {
    image(blockI2, X, Y);
    }
    if(type == BlockType.WALL3)
    {
      image(blockINone, X, Y);
    image(blockI3, X-10, Y-20);
    }
    if(type == BlockType.DOOR)
    {
    image(blockIDoor, X, Y);
    }
    if(type == BlockType.FROGSTATUE)
    {
      image(blockINone, X, Y);
    image(blockIFrogStatue, X, Y);
    }
    if(type == BlockType.LADDER)
    {
      image(blockINone, X, Y);
    image(blockILADDER, X, Y);
    }
    if(type == BlockType.LANTERN)
    {
    image(blockINone, X, Y);
    image(blockILANTERN,X, Y);
    setDark(blockX,blockY);
    }
    if(type == BlockType.SPIKE)
    {
        if(world.get(currentMap).blocks[int(blockX/blockSize)][int(blockY/blockSize)-1].type != BlockType.HOLE)
        {
          image(blockINone, X, Y);
        }
    image(blockISPIKE,X,Y);
    }
    if(type == BlockType.BadGuy)
    {
    image(badGuy,X,Y);
    }

  }
  //gettera
  float top()     {return blockY;}//returns top
  float bottom()  {return blockY+size; }//returns bottom
  float left()    {return blockX;}//returns left
  float right()   {return blockX+size;}// returns right
  float xMiddle() {return blockX+size/2;}//returns middle on x axis
  float yMiddle() {return blockY+size/2;}//returns middle on y axis
  
 
}


public enum BlockType
{

  WALL1, WALL2, WALL3, THIN, DOOR, NONE,
  FROGSTATUE, LADDER, LANTERN, TREE, HOLE, SPIKE, FIRE,BadGuy
}
