class Portal
{
  int originMap;
  int originX, originY;
  
  int destMap;
  int destX, destY;
  
  boolean locked = false;
  
  public Portal(int om, int ox, int oy, int dm, int dx, int dy)
  {
    originMap = om;
    originX   = ox;
    originY   = oy;
    destMap   = dm;
    destX     = dx;
    destY     = dy;
    
    
  } 
  
    public Portal(int om, int ox, int oy, int dm, int dx, int dy, boolean twoWay)
  {
    originMap = om;
    originX   = ox;
    originY   = oy;
    destMap   = dm;
    destX     = dx;
    destY     = dy;
    
    doors.add(new Portal(dm,dx, dy, om, ox ,oy));
  } 
}
