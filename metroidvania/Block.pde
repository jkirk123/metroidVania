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
  
  // mathods
  public Block(char t, float x, float y)
  {
    blockX = x;
    blockY = y;
    size = blockSize;

    pathable = true;
    Glow = false;
    type = setType(t);
    brightness = 100;
    
  }

  private BlockType setType(char t)
  {
    switch(t)
    {
      
      case '#': pathable = false; return BlockType.WALL1;
      case '[': pathable = false; return BlockType.WALL2;
      case ']': pathable = false; return BlockType.WALL3;
      case '-': Glow = false; return BlockType.THIN;
      case 'D': Glow = false;return BlockType.DOOR;
      case 'F': Glow = false;return BlockType.FROGSTATUE;
      case 'L': Glow = false;return BlockType.LADDER;
      case '!': Glow = true; return BlockType.LANTERN;
      case 'T': Glow = false;return BlockType.TREE;
      case '.': Glow = false;return BlockType.HOLE;
      case '^': Glow = false;return BlockType.SPIKE;
      case 'X': Glow = true; return BlockType.FIRE;
      default: return BlockType.NONE;
    }
    
    
    //return BlockType.NONE;
  }
  void setDark(float lightX, float lightY)
  {
  float X = blockX+ xOffset;
  float Y = blockY+ yOffset;
  
  brightness = int(dist(lightX+xOffset,lightY+yOffset,X,Y)/blockSize);
  //return;
   if(brightness > scrollXDist/blockSize)
    {
      image(darkness, X, Y);
      //return;
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
  }
  

  void drawMe()
  {
    float X = blockX+ xOffset;
    float Y = blockY+ yOffset;
    
    for(Portal p: doors)
    {
      if( p.locked && p.originMap == currentMap && blockX == p.originX*blockSize && blockY == p.originY*blockSize )
      {
      image(DoorLocked, X, Y);
      
      return;
      }
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
    
    }
    if(type == BlockType.SPIKE)
    {
        if(world.get(currentMap).blocks[int(blockX/blockSize)][int(blockY/blockSize)-1].type != BlockType.HOLE)
        {
          image(blockINone, X, Y);
        }
    image(blockISPIKE,X,Y);
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
  FROGSTATUE, LADDER, LANTERN, TREE, HOLE, SPIKE, FIRE,BadDude
}
