//Handles raycasting for players targeted block
public void breakBlock(){
  player.blockDamage = 0;
  float yDelta = - cos(player.vDeg)/100;
  float xDelta = - sin(player.hDeg) * sin(player.vDeg)/100;
  float zDelta = + cos(player.hDeg) * sin(player.vDeg)/100;
    
  float yCenter = player.yPosition + yDelta;
  float xCenter = player.xPosition + xDelta;
  float zCenter = player.zPosition +  zDelta;
  
  int counter = 0;
  try{
    while ((c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16] == null ||c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16].isLiquid())&&counter < 1200){

      yCenter += yDelta;
      xCenter += xDelta;
      zCenter += zDelta;
      
      counter ++;
      
    }
    if(counter <1200){
      
      Chunk chunk = c.getChunkAt(floor(xCenter/16),floor(zCenter/16));
     
      Block block = chunk.blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ) )*16];
      chunk.removeBlock((floor(xCenter )-(floor(xCenter/16) )*16), floor( yCenter), (floor(zCenter))-(floor(zCenter/16 ) )*16, true);
      BlockType blocktype = BlockTypes.get(block.blockType);
      int drop = blocktype.dropped;

      
      player.addToInventory(drop);

    }
  }catch(Exception e){
    //println(floor(xCenter )-(floor(xCenter/16) )*16);
  }
  
}

public void placeBlock(){
  //float time1 = millis();
  float yDelta = - cos(player.vDeg)/10;
  float xDelta = - sin(player.hDeg) * sin(player.vDeg)/10;
  float zDelta = + cos(player.hDeg) * sin(player.vDeg)/10;
    
  float yCenter = player.yPosition + yDelta;
  float xCenter = player.xPosition + xDelta;
  float zCenter = player.zPosition +  zDelta;
  PVector playerPosition = new PVector(floor(player.xPosition), floor(player.yPosition), floor(player.zPosition));
  PVector playerPositionplusOne = new PVector(floor(player.xPosition), floor(player.yPosition+1.499), floor(player.zPosition));
  int counter = 0;
  try{
    while (c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16] == null){

      yCenter += yDelta;
      xCenter += xDelta;
      zCenter += zDelta;
      counter ++;
      
    }
    while (c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16] != null){
      yCenter -= yDelta/100;
      xCenter -= xDelta/100;
      zCenter -= zDelta/100;
      
      
    }
    if(counter <120 &&(! new PVector(floor(xCenter), floor(yCenter), floor(zCenter) ).equals(playerPosition)) &&(! new PVector(floor(xCenter), floor(yCenter), floor(zCenter) ).equals(playerPositionplusOne))){
   
      Chunk chunk = c.getChunkAt(floor(xCenter/16),floor(zCenter/16));
      //Block block = chunk.blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ) )*16];
      if (player.getSelectedStack() != null){
        chunk.setBlock( player.getSelectedStack().itemType,(floor(xCenter )-(floor(xCenter/16) )*16), floor( yCenter), (floor(zCenter))-(floor(zCenter/16 ) )*16, true);
        player.useItem();
      }
      
    }
  }catch(Exception  e){
  }
  
}


public int[] findTargetedBlock(){

  float yDelta = - cos(player.vDeg)/100;
  float xDelta = - sin(player.hDeg) * sin(player.vDeg)/100;
  float zDelta = + cos(player.hDeg) * sin(player.vDeg)/100;
    
  float yCenter = player.yPosition + yDelta;
  float xCenter = player.xPosition + xDelta;
  float zCenter = player.zPosition +  zDelta;
  
  int counter = 0;
  
  int[] nums = new int[5];
  try{
    while (c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16] == null){
      
      yCenter += yDelta;
      xCenter += xDelta;
      zCenter += zDelta;
      
      counter ++;
      
    }
    if(counter <1200){
      

      nums[0] = floor(xCenter/16);
      nums[1] = floor(zCenter/16);
     
      nums[2] = floor(xCenter )-(floor(xCenter/16) )*16;
      nums[3] = floor( yCenter);
      nums[4] = (floor(zCenter))-(floor(zCenter/16 ) )*16;

      

    }
    
  }catch(Exception e){
  }
  return nums;
}

public Entity findTargetedEntity(){
  float yDelta = - cos(player.vDeg)/100;
  float xDelta = - sin(player.hDeg) * sin(player.vDeg)/100;
  float zDelta = + cos(player.hDeg) * sin(player.vDeg)/100;
    
  float yCenter = player.yPosition + yDelta;
  float xCenter = player.xPosition + xDelta;
  float zCenter = player.zPosition +  zDelta;
  
  int counter = 0;
  
  while (getEntityAt(new PVector(xCenter, yCenter, zCenter))==null && counter < 300){
    
    yCenter += yDelta;
    xCenter += xDelta;
    zCenter += zDelta;
    
    counter ++;
    
  }
    
  return getEntityAt(new PVector(xCenter, yCenter, zCenter));  
}

public void getLiquid(){
  player.blockDamage = 0;
  float yDelta = - cos(player.vDeg)/100;
  float xDelta = - sin(player.hDeg) * sin(player.vDeg)/100;
  float zDelta = + cos(player.hDeg) * sin(player.vDeg)/100;
    
  float yCenter = player.yPosition + yDelta;
  float xCenter = player.xPosition + xDelta;
  float zCenter = player.zPosition +  zDelta;
  
  int counter = 0;
  try{
    while ((c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16] == null ||!c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16].isLiquid())&&counter < 1200){
      
      yCenter += yDelta;
      xCenter += xDelta;
      zCenter += zDelta;
      
      counter ++;
      
    }
    if(counter <1200){
      
      Chunk chunk = c.getChunkAt(floor(xCenter/16),floor(zCenter/16));
     
      Block block = chunk.blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ) )*16];
      chunk.removeBlock((floor(xCenter )-(floor(xCenter/16) )*16), floor( yCenter), (floor(zCenter))-(floor(zCenter/16 ) )*16, true);
      BlockType blocktype = BlockTypes.get(block.blockType);
      int drop = blocktype.dropped;

      player.useItem();
      player.addToInventory(drop);

    }
  }catch(Exception e){
  }
  
}
public void placeLiquid(){
  float yDelta = - cos(player.vDeg)/10;
  float xDelta = - sin(player.hDeg) * sin(player.vDeg)/10;
  float zDelta = + cos(player.hDeg) * sin(player.vDeg)/10;
    
  float yCenter = player.yPosition + yDelta;
  float xCenter = player.xPosition + xDelta;
  float zCenter = player.zPosition +  zDelta;
  PVector playerPosition = new PVector(floor(player.xPosition), floor(player.yPosition), floor(player.zPosition));
  PVector playerPositionplusOne = new PVector(floor(player.xPosition), floor(player.yPosition+1.499), floor(player.zPosition));
  int counter = 0;
  try{
    while (c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16] == null){

      yCenter += yDelta;
      xCenter += xDelta;
      zCenter += zDelta;
      counter ++;
      
    }
    while (c.getChunkAt(floor(xCenter/16),floor(zCenter/16)).blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ))*16] != null){
      yCenter -= yDelta/100;
      xCenter -= xDelta/100;
      zCenter -= zDelta/100;
      
      
    }
    if(counter <120 &&(! new PVector(floor(xCenter), floor(yCenter), floor(zCenter) ).equals(playerPosition)) &&(! new PVector(floor(xCenter), floor(yCenter), floor(zCenter) ).equals(playerPositionplusOne))){
   
      Chunk chunk = c.getChunkAt(floor(xCenter/16),floor(zCenter/16));
      //Block block = chunk.blocks[floor(xCenter )-(floor(xCenter/16) )*16][floor( yCenter)][(floor(zCenter))-(floor(zCenter/16 ) )*16];
      if (player.getSelectedStack() != null){
        chunk.setBlock( player.getSelectedStack().itemType,(floor(xCenter )-(floor(xCenter/16) )*16), floor( yCenter), (floor(zCenter))-(floor(zCenter/16 ) )*16, true);
        player.useItem();
        player.addToInventory(160);
      }
      
    }
  }catch(Exception  e){
    println("HI");
  }
}
