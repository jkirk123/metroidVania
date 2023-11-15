class Map
{
  Block blocks[][];
 
  int xSize, ySize;
  int closestX, closestY;
  
  public Map(String blockString, int x, int index)
  {
    xSize = x;
    ySize = blockString.length()/x;
    blocks = new Block[xSize][ySize];
    assignBlocksByString(blockString, index);
  }
  
  private void assignBlocksByString(String blockMap, int index)
  {
    for(int i =0; i< ySize ; i++)
    {
      println("i = " + i);
      for(int j = 0; j< xSize; j++)
      {
        //println("j = " + j);
        blocks[j][i] = new Block( blockMap.charAt((i*xSize)+j), j*blockSize, i*blockSize );
      }
    }
  }
  
  Block fetch(int x, int y)
  {
  return blocks[x][y];
  }
  
  void drawMap()
  {
    for(int i= 0; i < xSize; i++)
    {
      for(int j = 0; j < ySize; j++ )
      {
        if(!blocks[i][j].background)
        {
          blocks[i][j].drawMe();
        }
        
      }
    }
  }
         
  void drawShadow()
  {
  for(int i= 0; i < xSize; i++)
    {
      for(int j = 0; j < ySize; j++ )
      {
        
        //blocks[i][j].setDark(p.playerX,p.playerY);
        
        
        if(blocks[i][j].Glow )
        {
         blocks[i][j].setDark(blocks[i][j].blockX, blocks[i][j].blockY);
        }
        blocks[i][j].setDark(p.playerX,p.playerY);
        
      }
     }
  }
  
    void CheckMapCollision()
  {
        
    //p.onGround = false;  && dist(p.playerX,p.playerY,blocks[i][j].blockX,blocks[i][j].blockY) < p.playerSize+p.maxSpeed
    for(int i= 0; i < xSize; i++)
    {
      for(int j = 0; j < ySize; j++ )
      {
        if(blocks[i][j].pathable )
        {
          if(dist(p.playerX,p.playerY,blocks[i][j].blockX,blocks[i][j].blockY) < dist(p.playerX,p.playerY,blocks[closestX][closestY].blockX,blocks[closestX][closestY].blockY))
          {
            closestX = i;
            closestY = j;
          }
        }
      }
    }
    
    
    for(int i= 0; i < xSize; i++)
    {
      for(int j = 0; j < ySize; j++ )
      {

        
        if(!blocks[i][j].pathable )
        {
           p.checkCollision(blocks[i][j]); 
        }
        if(blocks[int(p.playerX/blocks[i][j].size)][int(p.playerY/blocks[i][j].size)+1].pathable 
        && blocks[int(p.left()/blocks[i][j].size)][int(p.playerY/blocks[i][j].size)+1].pathable 
        && blocks[int(p.right()/blocks[i][j].size)][int(p.playerY/blocks[i][j].size)+1].pathable
        || !blocks[int(p.playerX/blocks[i][j].size)][int(p.playerY/blocks[i][j].size)].pathable )
        {
          p.onGround = false;
          
        }
        
        try
        {  
          if(!blocks[int(p.playerX/blocks[i][j].size)][int(p.playerY/blocks[i][j].size)].pathable
          && !blocks[int(p.playerX/blocks[i][j].size)][int(p.playerY/blocks[i][j].size)+1].pathable
          && !blocks[int(p.playerX/blocks[i][j].size)][int(p.playerY/blocks[i][j].size)-1].pathable
          && !blocks[int(p.playerX/blocks[i][j].size)+1][int(p.playerY/blocks[i][j].size)].pathable
          && !blocks[int(p.playerX/blocks[i][j].size)-1][int(p.playerY/blocks[i][j].size)].pathable)
          {
            p.playerX = blocks[closestX][closestY].blockX;
            p.playerY = blocks[closestX][closestY].blockY;
          }
        }
        catch(Exception E)
        {
          p.playerX = blocks[closestX][closestY].blockX;
          p.playerY = blocks[closestX][closestY].blockY;
        }


      }
    }
  }
  //blocks[i][j].pathable && p.bottom() <= blocks[i][j].bottom() && p.bottom() >= blocks[i][j].top() 
}
