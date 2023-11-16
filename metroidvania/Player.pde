class Player
{
  //data
  float playerX, playerY, playerSize;

  float xSpd, ySpd;

  float maxSpeed;

  boolean onGround;
  boolean moving = false;
  boolean left;
  boolean doublej = false;
  //boolean dead = false;
  int keyChain = 0;
  
  
  float respawnX, respawnY;
  

  //methods
  public Player(float x, float y, float s, float ms)//constructinator
  {
    playerX = x;
    playerY = y;
    playerSize = s;
    maxSpeed = ms;
        
    //playerI = loadImage("DarkFrog.png");
    //playerI.resize(int(playerSize), 0);
    
     playerILeft = loadImage("leftFrog-1.png.png");
    playerILeft.resize(int(playerSize), 0);
    
    
    playerIRight = loadImage("rightFrog-1.png.png");
    playerIRight.resize(int(playerSize), 0);
    
    playerIFalling = loadImage("fallingFrog-1.png.png");
    playerIFalling.resize(int(playerSize), 0);
    
    
    playerIFallingL = loadImage("fallingFrogLeft-1.png.png");
    playerIFallingL.resize(int(playerSize), 0);
    
    playerIDeadR = loadImage("ZombRight.png");
    playerIDeadR.resize(int(playerSize), 0);
    
    playerIDeadL = loadImage("Zomb-1.png.png");
    playerIDeadL.resize(int(playerSize), 0);
    
    
    playerIDeadR2 = loadImage("ZombGrey-1R.png");
    playerIDeadR2.resize(int(playerSize), 0);
    
    playerIDeadL2 = loadImage("ZombGrey-1.png.png");
    playerIDeadL2.resize(int(playerSize), 0);
    
    
    playerIDeadR3 = loadImage("skeleton-1R.png");
    playerIDeadR3.resize(int(playerSize), 0);
    
    playerIDeadL3 = loadImage("skeleton-1.png.png");
    playerIDeadL3.resize(int(playerSize), 0);
    
    playerIDeadR4 = loadImage("skeletonBroke-1R.png");
    playerIDeadR4.resize(int(playerSize), 0);
    
    playerIDeadL4 = loadImage("skeletonBroke-1.png.png");
    playerIDeadL4.resize(int(playerSize), 0);
    
    playerIDead5 = loadImage("skeletonPile-1.png.png");
    playerIDead5.resize(int(playerSize), 0);
    
    respawnX = x;
    respawnY = y;
    //speed defaults to zero
  }

  void movePlayer()
  {
    
    playerX += xSpd; // applies speed
    playerY += ySpd;
    
    
    if(moving)
    {

      if(!left  )
      {
      speed(-0.4);  
      }
      
      if(left  )
      {
      speed(0.4);  
      }
    }
    checkForScroll();
    
    

    if (!onGround )//applies gravity
    {
      ySpd += gravity;
    }

    if (!moving )//applies friction
    {
      xSpd *= friction;
      if (xSpd < 1 && xSpd > -1)
      {
       xSpd = 0;
      }
    }
    
    

   
    if (ySpd >= (maxSpeed*1.5))
      ySpd = (maxSpeed*1.5);

   // if (ySpd <= (maxSpeed) *-1)
      //ySpd = (maxSpeed)*-1;
      
      

      checkForDeath();
  }
  

  void drawPlayer()
  {
    //fill(28, 86, 155);
    //circle(playerX, playerY, playerSize); // draws the character
    //imageMode(CENTER);
    //if(onGround && !dead)
    //image(playerI,left() + xOffset, top() + yOffset);
    
     if( ySpd > 5 && !onGround && left)
    image(playerIFalling,left() + xOffset, top() + yOffset);
    
    else if( ySpd > 5 && !onGround && !left)
    image(playerIFallingL,left() + xOffset, top() + yOffset);
    
    else if( !left )
    image(playerILeft,left() + xOffset, top() + yOffset);
    
    else if( left  )
    image(playerIRight,left() + xOffset, top() + yOffset);
    //else if(dead && left)
    //image(playerIDeadL,left() + xOffset, top() + yOffset);
    //else if(dead && !left)
    //image(playerIDeadR,left() + xOffset, top() + yOffset);
    
    
    text( int(playerX/blockSize)+", "+int(playerY/blockSize), 50,50);
  }
  
  void checkForDeath()
  {
    switch(currentBlockType())
    {
    case SPIKE:
    case FIRE:
    case BadGuy:
      
      Morgue.add(new Corpse(left(),top(),left,0,currentMap)); 
      playerX = respawnX;
      playerY = respawnY;
      for( Corpse C: Morgue)
      {
       C.age+=1;
       println("age corpse " + C.age);
      }
      break;

    }
  }
  void checkForDeath(boolean die)
  {
    
      Morgue.add(new Corpse(left(),top(),left,0,currentMap)); 
      playerX = respawnX;
      playerY = respawnY;
      for( Corpse C: Morgue)
      {
       C.age+=1;
       println("age corpse " + C.age);
      }
     ;

    
  }

  void jump()
  {
    println("onGround " + onGround);
    if ( onGround &&  left && moving)
    {
      ySpd += -15;
      speed(7);
      onGround = false;
    }
    else if ( onGround &&  !left && moving)
    {
      ySpd += -15;
      speed(-7);
      onGround = false;
    }
    else if(onGround &&  !moving)
    {
      ySpd += -25;
      onGround = false;
    }
    else if(!onGround &&  doublej)
    {
      
      ySpd = -15;
      //xSpd *= 1.5;
      doublej = false;
    }
     
     
     //onGround = false;
  }
  
  

  void speed(float change) //enforces max speed
  {
    if (change > 0 && xSpd < maxSpeed && onGround|| change < 0 && xSpd > (maxSpeed * -1) && onGround)
      xSpd = change;
    else if (change > 0 && xSpd < maxSpeed || change < 0 && xSpd > (maxSpeed * -1) )
      xSpd += change;
     
       
     
      
      
    //if(xSpd > maxSpeed || xSpd < (maxSpeed *-1))
    //xSpd *= 0.9; 
    
    println("xSpd: " + xSpd + " ySpd: " + ySpd);
    println("playerX: " + playerX + " playerY: " + playerY);
    
  }

  void checkCollision(Block b)
  {
    //chacks Keys
    for(Key k: Keys )
    {
      if(!k.grabbed && dist(playerX, playerY, k.xPos *blockSize,k.yPos*blockSize) < blockSize)
      {
      k.grabbed = true;
      keyChain++  ;
      }
    }
    
    
    if(bottom() >= b.top() && playerX >= b.left()-(playerSize/3) && playerX <= b.right()+(playerSize/3) && bottom() <= b.yMiddle() && ySpd > 0)
      {
        snapTo(b,"top"); 
        
      }
    
      
    if(top() < b.bottom() && playerX >= b.left()-(playerSize/3) && playerX <= b.right()+(playerSize/3) &&  top() >= b.yMiddle()&& ySpd < 0)
      snapTo(b,"bottom");
      
    if(right() >= b.left() && playerY <= b.bottom() && playerY >= b.top() && right() <= b.xMiddle())
     snapTo(b, "left");
    
    if(left() <= b.right() && playerY <= b.bottom() && playerY >= b.top() && left() >= b.xMiddle())
     snapTo(b, "right");
      

    

    
    
    
    
   
  }

  void snapTo(Block B, String side)
  {
    //onGround = false;
    if (side.toUpperCase().equals("TOP"))
    {
      //println("top");
      if(ySpd > maxSpeed*1.4)
      ySpd *= -0.6;
      else
      ySpd = 0;
      while (bottom() > B.top()-1)
      {

        playerY-= 0.1;
      }
      onGround = true;
      doublej = true;
      
      
      
    }

    if (side.toUpperCase().equals("BOTTOM"))
    {
      //println("bottom");
      
      ySpd = gravity;
      while (top() < B.bottom())
      {
        playerY+= 0.1;
      }
    }

    if (side.toUpperCase().equals("RIGHT"))
    {
      //println("right");
      
      xSpd *= 0.5;
      while (left() < B.right()+1)
      {
        playerX+= 0.1;
      }
    }

    if (side.toUpperCase().equals("LEFT"))
    {
      //println("left");
      
      xSpd *= -0.5;
      while (right() > B.left()-1)
      {
        playerX-= 0.1;
      }
    }
  }
    
  //************************//
  // Will move the 'screen' //
  //  when the player gets  //
  //   close to an edge.    //
  //************************//
  public void checkForScroll()
  {
    
    
    if( playerY+yOffset < (scrollYDist) ) //screen up
      yOffset -= playerY+yOffset-scrollYDist;
    
    if( playerX+xOffset < (scrollXDist) ) //screen left
      xOffset -= playerX+xOffset -scrollXDist;
      
    if( playerY+yOffset > height-(scrollYDist) ) //screen down
      yOffset -= playerY+yOffset - (height-scrollYDist);
      
    if( playerX+xOffset > width-(scrollXDist)) //screen right
      xOffset -= playerX+xOffset - (width-scrollXDist);
  }
  

  float top() {return  playerY- (playerSize/2);}//returns top
  
  float bottom() { return  playerY+(playerSize/2);}//returns bottom
  
  float left() {return  playerX-(playerSize/2);}//returns left
  
  float right() { return  playerX+(playerSize/2);}// returns right
  
  BlockType currentBlockType()
  {
    Block answer;
    int answerX = int(playerX/blockSize);
    int answerY = int(playerY/blockSize);
    try{
    answer = world.get(currentMap).blocks[answerX][answerY];
    return answer.type;
    }
    catch(Exception E)
    {
    return BlockType.NONE;
    }
  }
  
  
}



class Corpse
{
float xPos, yPos;
boolean left;
int age;
int Map;

 public Corpse(float x,float y, boolean l, int A,int m)
 {
 xPos = x;
 yPos = y;
 left = l;
 age = A;
 Map = m;
 }
 
 void drawMe()
 {
   if(Map != currentMap)
   return;
   
   if(left&& age == 1)
   image(playerIDeadL,xPos + xOffset, yPos + yOffset);
   else if (!left && age == 1)
   image(playerIDeadR,xPos + xOffset, yPos + yOffset);
 
   else if(left && age == 2)
   image(playerIDeadL2,xPos + xOffset, yPos + yOffset);
   else if (!left && age == 2)
   image(playerIDeadR2,xPos + xOffset, yPos + yOffset);
 
   else if(left && age == 3)
   image(playerIDeadL3,xPos + xOffset, yPos + yOffset);
   else if (!left && age == 3)
   image(playerIDeadR3,xPos + xOffset, yPos + yOffset);
 
   else if(left && age == 4)
   image(playerIDeadL4,xPos + xOffset, yPos + yOffset);
   else if (!left && age == 4)
   image(playerIDeadR4,xPos + xOffset, yPos + yOffset);
   if(age > 4)
   image(playerIDead5,xPos + xOffset, world.get(currentMap).fetch(int(xPos/blockSize),int((yPos-10)/blockSize)+1).bottom()-p.playerSize + yOffset);
  
 }
 void ageing()
 {
 age++;
 }
}
