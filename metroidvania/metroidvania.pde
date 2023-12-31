 //james kirk
//metroidvania
import processing.sound.*;
// block


PImage blockI;

PImage blockI2;
PImage blockI3;
PImage blockIDoor;
PImage DoorLocked;
PImage blockIFrogStatue;
PImage blockILADDER;
PImage blockILANTERN;
PImage blockITREE;
PImage blockINone;
PImage badGuy;
PImage openBadGuy;

PImage blockISPIKE;
PImage blockIFIRE;
float blockSize = 60;
//ArrayList<Block> blocks = new ArrayList<Block>();


//world data
PImage BackgroundI;
float friction;
float gravity;
float floorY;
ArrayList<Map> world = new ArrayList<Map>();
ArrayList<Portal> doors = new ArrayList<Portal>();
ArrayList<Key> Keys = new ArrayList<Key>();
ArrayList<Corpse> Morgue = new ArrayList<Corpse>();
PImage Keyi;
PImage darkness;
//String testMap = ""; //for testing
//Map m;               //for testing
//int mapX;            //for testing

//player
Player p;
PImage playerI;
PImage playerIDeadL;
PImage playerIDeadR;
PImage playerIDeadL2;
PImage playerIDeadR2;
PImage playerIDeadL3;
PImage playerIDeadR3;
PImage playerIDeadL4;
PImage playerIDeadR4;
PImage playerIDead5;
PImage playerILeft;
PImage playerIRight;
PImage playerIFalling;
PImage playerIFallingL;
int currentMap = 0;
//scrolling data
int scrollXDist = 200; //default distances
int scrollYDist = 100; //changes based on window size in setup()
float xOffset = 0;
float yOffset = 0;

//enemy dataat
ArrayList<Shot> arsenal = new ArrayList<Shot>();
PImage eyeShot;

//sound
SoundFile DoorSound;
//cutting bread(open door)
//


void setup()
{
  DoorSound = new SoundFile(this, "door.wav");

  darkness = loadImage("darkness-1.png.png");
  darkness.resize(int(blockSize), 0);
  
  eyeShot = loadImage("eyeShot.png");

  blockI = loadImage("block.png");
  blockI.resize(int(blockSize), 0);

  blockI2 = loadImage("BrokenWall-1.png.png");
  blockI2.resize(int(blockSize), 0);

  blockI3 = loadImage("skeletonPile-1.png (1).png");
  blockI3.resize(int(blockSize*1.2), 0);

  blockIDoor = loadImage("door.png");
  blockIDoor.resize(int(blockSize), 0);

  blockIFrogStatue = loadImage("GoldFrog.png");
  blockIFrogStatue.resize(int(blockSize), int(blockSize));

  blockILADDER = loadImage("ladder-1.png.png");
  blockILADDER.resize(int(blockSize), 0);

  blockILANTERN = loadImage("fly lantern-1.png");
  blockILANTERN.resize(int(blockSize), 0);

  blockITREE = loadImage("tree.png");
  blockITREE.resize(int(blockSize*2), 0);

  blockIFIRE = loadImage("skullFire-1.png.png");
  blockIFIRE.resize(int(blockSize), 0);

  blockINone = loadImage("wallDark.png");
  blockINone.resize(int(blockSize), 0);

  badGuy = loadImage("closed eye-1.png (1).png");
  badGuy.resize(int(blockSize), 0);
  
  openBadGuy = loadImage("open eye.png");
  openBadGuy.resize(int(blockSize), 0);

  blockISPIKE = loadImage("FloorSpike-1.png.png");
  blockISPIKE.resize(int(blockSize), 0);

  Keyi = loadImage("Key-1.png.png");
  Keyi.resize(int(blockSize), 0);

  DoorLocked = loadImage("doorLocked.png");
  DoorLocked.resize(int(blockSize), 0);

  //BackgroundI = loadImage("New Piskel-1.png (1).png");
  BackgroundI = loadImage("darkness.png");
  BackgroundI.resize(width, height);


  //sets all the variables
  //fullScreen();
  size(1800, 1000);

  friction = 0.4;

  gravity = 1.2;
  //floorY = height;

  println("Creating Player...");
  p = new Player(100, 100, 35, 20);

  loadGame();
  //for(int i = 0; i < 300; i++)
  //  blocks.add(new Block('#', int(random(width)), 800));
  //rectMode(CENTER);

  println("Creating Maps...");
  makeMaps();
  println("Maps made");
}

void draw()
{

  fill(0, 90);
  image(BackgroundI, 0, 0);

  world.get(currentMap).drawMap();
  world.get(currentMap).CheckMapCollision();
  /*
  fill(0);
   rect(world.get(currentMap).xSize*blockSize, 0, xOffset, height);
   rect(0, 0, xOffset, height);
   rect(0, 0, width, yOffset);
   rect(0, world.get(currentMap).ySize*blockSize, width, yOffset);
   */
  //m.drawMap();
  //m.CheckMapCollision();
  //text("Current Block: " + p.currentBlockType().type,100,900);

  p.movePlayer();
  p.drawPlayer();

  for ( Key k : Keys)
    k.drawKey();

  for ( Corpse C : Morgue)
    C.drawMe();

  for (int i = 0; i < arsenal.size(); i++)
  {
    arsenal.get(i).moveAndDraw();
    if (arsenal.get(i).ShotOver)
    {
      arsenal.remove(i);
    }
  }
  
  world.get(currentMap).drawShadow();

  // println("keys " + p.keyChain);
}


void useDoor()
{
  for ( Portal d : doors )
  {
    if ( currentMap == d.originMap &&  int(p.playerX/blockSize) == d.originX &&  int(p.playerY/blockSize) == d.originY  )
    {
      if (d.locked)
      {
        if (p.keyChain> 0)
        {
          p.keyChain--;
          d.locked = false;
        }
        return;
      }
      currentMap = d.destMap;
      p.playerX = p.respawnX = int(d.destX*blockSize);
      p.playerY = p.respawnY = int(d.destY*blockSize);
      DoorSound.play();
      if (d.destMap == 5)
      {
        scrollXDist = 500;
        scrollYDist = 300;
      }
      p.onGround = false;

      for (Key k : Keys )
      {
        if (!k.grabbed && d.originMap != d.destMap )
        {
          k.grabbed = false;
        }
      }

      arsenal.clear();
      break;
    }
  }
}

void lockDoor()
{
  doors.get( doors.size()-1).locked = true;
}

void keyPressed()
{
  println("onGround " + p.onGround);
  // does the jumping

  if (key == ' ' )
  {
    println("onGround " + p.onGround);
    p.jump();
  }




  if (key == 'd' )
  {
    p.moving = true;
    p.left = true;
  }

  if (key == 'a' )
  {
    p.moving = true;
    p.left = false;
  }
  if (key == 'w')
  {
    useDoor();
  }
  if (key == '`')
  {
    print(0/0);
  }


  if (key == 'r')
  {

    p.checkForDeath(true);
    saveGame();
  }
}

void keyReleased()
{
  println("released");
  //if(p.onGround)
  p.moving =  false;
}

void mousePressed()
{
  
}

void saveGame()
{
try
{
PrintWriter pw = createWriter( "save.txt");

pw.println(currentMap);
pw.println(p.playerX);
pw.println(p.playerY);
pw.println(p.keyChain);


pw.flush();
pw.close();

}
catch (Exception e)
{
println("error while saving");
}
}

void loadGame()
{
  try
  {
   String data[] = loadStrings("save.txt");
   currentMap = Integer.parseInt(data[0]);
   p.playerX = Float.parseFloat(data[1]);
   p.playerY = Float.parseFloat(data[2]);
   p.keyChain = Integer.parseInt(data[3]);
   
   //p.respawnY = p.playerY;
   //p.respawnX = p.playerX;
   
   if (currentMap >= 5)
      {
        scrollXDist = 500;
        scrollYDist = 300;
      }
   
  }
  catch(Exception e)
  {
  println("error while loading");
  }
}
