//Class for all chunk functionality
public class Chunk{
  public int lowestXPos, lowestYPos, lowestZPos;

  
  public final int cWidth = 16, cLength = 16, cHeight = 128;
  
  
  
  public PShape mesh;
  public World world;
  
  
  Block[][][] blocks;
  
  public Chunk(int lowestXPos, int lowestYPos, int lowestZPos, World world){
    this.lowestXPos = lowestXPos;
    this.lowestYPos = lowestYPos;
    this.lowestZPos = lowestZPos;
    
    this.blocks = new Block[cWidth][cHeight][cLength];
    this.mesh = createShape();
    
    this.world = world;
    
    
  }
  
  public void removeBlock(int x, int y, int z, boolean byUser){
    blocks[x][y][z] = null;
    if (byUser){
      this.betterGenerateMesh();
      try{
      
        if(x == 0){
          //println("Checking chunk: " + ((lowestXPos)/16 -1) + ", " + lowestZPos/16);
          this.world.getChunkAt(lowestXPos/16-1, lowestZPos/16).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
      try{
      
        if(x == 15){
          //println("Checking chunk: " + ((lowestXPos)/16 + 1) + ", " + lowestZPos/16);
          this.world.getChunkAt(lowestXPos/16+1,lowestZPos/16).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
      try{
      
        if(z == 0){
          //println("Checking chunk: ", + (lowestXPos/16) + ", " + ((lowestZPos)/16 -1) );
          this.world.getChunkAt(lowestXPos/16, lowestZPos/16-1).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
      try{
      
        if(z == 15){
          //println("Checking chunk: " +(lowestXPos/16) + ", " + ((lowestZPos)/16 + 1)  );
          this.world.getChunkAt(lowestXPos/16, lowestZPos/16+1).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
    }
  }
  public void setBlock(int blockId, int x, int y, int z, boolean byUser){
    blocks[x][y][z] = new Block(blockId);
    if (byUser){
      this.betterGenerateMesh();
      try{
      
        if(x == 0){
          //println("Checking chunk: " + ((lowestXPos)/16 -1) + ", " + lowestZPos/16);
          this.world.getChunkAt(lowestXPos/16-1, lowestZPos/16).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
      try{
      
        if(x == 15){
          //println("Checking chunk: " + ((lowestXPos)/16 + 1) + ", " + lowestZPos/16);
          this.world.getChunkAt(lowestXPos/16+1,lowestZPos/16).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
      try{
      
        if(z == 0){
          //println("Checking chunk: ", + (lowestXPos/16) + ", " + ((lowestZPos)/16 -1) );
          this.world.getChunkAt(lowestXPos/16, lowestZPos/16-1).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
      try{
      
        if(z == 15){
          //println("Checking chunk: " +(lowestXPos/16) + ", " + ((lowestZPos)/16 + 1)  );
          this.world.getChunkAt(lowestXPos/16, lowestZPos/16+1).betterGenerateMesh();
        }
      }catch(ArrayIndexOutOfBoundsException e){
        
      }
    }
    
  }
  

  
  
  
  public void betterDrawChunk(){
    shape(this.mesh);
    
  }
  public void betterGenerateMesh(){
    
    
    //int timeStamp1 = millis();
    while(drawingUI == true) delay(1);
    PShape newMesh = createShape();
    newMesh.beginShape(TRIANGLE);
    newMesh.noStroke();
    newMesh.texture(this.world.getTexture());
    //this.mesh = createShape(); //reset coords
    //this.mesh.beginShape(TRIANGLE);
    //this.mesh.noStroke();
    //this.mesh.texture(this.world.getTexture());
    
    
    
    for (int x = 0; x < blocks.length;x++){ //add face vertices to coords
      for (int y = 0; y < blocks[x].length;y++){
        for (int z = 0; z < blocks[x][y].length;z++){
           
          
          
          if (blocks[x][y][z] != null){
            Block block = blocks[x][y][z];
            PVector[] texCoords = this.world.textureCoords.get(block.blockType);
            if(!block.isNature()){
              if((x<15 && x>0) && (z<15 && z>0) && (y<127 & y>0)){
               

                if (blocks[x][y-1][z] == null ||(blocks[x][y-1][z].isTransparent() && ! block.isTransparent())){
                  block.drawTop(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[0]); 
                }
                
                
                if (blocks[x][y][z+1] == null ||(blocks[x][y][z+1].isTransparent() && ! block.isTransparent())){
                  block.drawSide1(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                  
                }
                  
                            
                if (blocks[x+1][y][z] == null ||(blocks[x+1][y][z].isTransparent() && ! block.isTransparent())){
                  block.drawSide2(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                }
                  
      
                
                  
                if (blocks[x][y][z-1] == null ||(blocks[x][y][z-1].isTransparent() && ! block.isTransparent())){
                  block.drawSide3(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                }
                  
                
                
                
                if (blocks[x-1][y][z] == null ||(blocks[x-1][y][z].isTransparent() && ! block.isTransparent())){
                  block.drawSide4(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                }
                  
                  
                  
                if (blocks[x][y+1][z] == null ||(blocks[x][y+1][z].isTransparent() && ! block.isTransparent())){
                  block.drawBottom(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[2]); 
                }
            
              
              }
              else{
                if(x == 0){
                  
                  Chunk chunk = this.world.getChunkAt(lowestXPos/16 -1, lowestZPos/16);
                  if(chunk != null){
                    if(chunk.blocks[15][y][z] == null ||(chunk.blocks[15][y][z].isTransparent() && ! block.isTransparent())){
                      block.drawSide4(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                    }
                  }
                }
                else{
                  if (blocks[x-1][y][z] == null ||(blocks[x-1][y][z].isTransparent() && ! block.isTransparent())){
                    block.drawSide4(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                  }
                }
                if(x == 15){
                  Chunk chunk = this.world.getChunkAt(lowestXPos/16 +1, lowestZPos/16);
                  if(chunk != null){
                    if(chunk.blocks[0][y][z] == null ||(chunk.blocks[0][y][z].isTransparent() && ! block.isTransparent())){
                      block.drawSide2(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                    }
                  }
                }
                else{
                  if (blocks[x+1][y][z] == null ||(blocks[x+1][y][z].isTransparent() && ! block.isTransparent())){
                    block.drawSide2(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                  }
                }
                
                if(z == 15){
                  Chunk chunk = this.world.getChunkAt(lowestXPos/16 , lowestZPos/16+1);
                  if(chunk != null){
                    if(chunk.blocks[x][y][0] == null ||(chunk.blocks[x][y][0].isTransparent() && ! block.isTransparent())){
                      block.drawSide1(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                    }
                  }
                }
                else{
                  if (blocks[x][y][z+1] == null ||(blocks[x][y][z+1].isTransparent() && ! block.isTransparent())){
                    block.drawSide1(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                    
                  }
                }
                if(z == 0){
                  Chunk chunk = this.world.getChunkAt(lowestXPos/16, lowestZPos/16-1);
                  if(chunk != null){
                    if(chunk.blocks[x][y][15] == null ||(chunk.blocks[x][y][15].isTransparent() && ! block.isTransparent())){
                      block.drawSide3(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                    }
                  }
                }
                else{
                  if (blocks[x][y][z-1] == null ||(blocks[x][y][z-1].isTransparent() && ! block.isTransparent())){
                    block.drawSide3(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[1]); 
                  }
                }
                
                if(y == 0){
                  block.drawTop(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[0]); 
                }
                else if(y == 127){
                  block.drawBottom(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[2]); 
                }
                if(y!= 0 ){
                  if (blocks[x][y-1][z] == null ||(blocks[x][y-1][z].isTransparent() && ! block.isTransparent())){
                    block.drawTop(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[0]); 
                  }
                }
                
                if(y!= 127 ){
                  if (blocks[x][y+1][z] == null ||(blocks[x][y+1][z].isTransparent() && ! block.isTransparent())){
                    block.drawBottom(newMesh, this.lowestXPos + x , this.lowestYPos + y , this.lowestZPos + z, texCoords[2]); 
                  }
                }
                
                
                            
                
                  
                
                
                
                
              }
            }else block.drawNature(newMesh, this.lowestXPos + x, this.lowestYPos + y, this.lowestZPos + z, texCoords[1]);
            
          }
        }
      }
    }
    
    newMesh.endShape();
    this.mesh = newMesh;
    
    //println("Generating mesh actually took: " + (millis()-timeStamp1)+ " ms");
    //println("------");
  }
  
  public String toString(){
    return("Chunk at " + this.lowestXPos + ", " + this.lowestZPos);
  }
  public void decorate(boolean nat){
    for (int x = 0; x< 16; x++) {
      for (int y = 0; y<16; y++) {
        int highness = 128-((int)map(noise(((this.lowestXPos+ x)/75.0), (this.lowestZPos + y)/75.0), 0, 1, 5, 100));
        if(highness > WATERLEVEL){
            for(int water = WATERLEVEL; water < highness; water ++){
              this.setBlock(4, x, water, y, false);
            }
          }
        if(highness < WATERLEVEL -6 &&((x<14 &&x > 1) &&(y<14 && y>1)) && nat){
          float random = random(0, 20);
          //println(random);
          if(random < 0.3){
            generateTree(highness, x, y);
            
            
          }
          else if (random<0.6){
            this.setBlock(12, x, highness-1, y, false);
          }
          else if(random<1){
            this.setBlock(13, x, highness-1, y, false);
          }
          else if(random <3){
            this.setBlock(14, x, highness-1, y, false);
          }
          else if(random < 3.3){
            this.setBlock(19, x, highness-1, y, false);
          }
          else if(random < 3.6){
            this.setBlock(20, x, highness-1, y, false);
          }
          
        }  
        if(highness > WATERLEVEL - 6){
          for (int h = highness; h<highness+2; h++) {
            this.setBlock(5, x, h, y, false);
          }
          for (int h = highness+2; h<highness+3; h++) {
            this.setBlock(8, x, h, y, false);
          }
        }else{
          for (int h = highness; h<highness+3; h++) {
            if(noise((this.lowestXPos + x)/20.0, (128-h)/20.0, (this.lowestZPos + y)/20.0) > 0.3)this.setBlock(1, x, h, y, false);
          }
        }
        for(int h = highness+3; h < 128; h++){
          if(noise((this.lowestXPos + x)/20.0, (128-h)/20.0, (this.lowestZPos + y)/20.0) > 0.3){
            this.setBlock(2, x, h, y, false);
          }
        }
      }
    }
    this.generateOres();
  }
  public void decorateFlat(){
    for (int x = 0; x< 16; x++) {
      for (int y = 0; y<16; y++) {
        int highness = 80;
        
        for (int h = highness; h<highness+3; h++) {
          this.setBlock(1, x, h, y, false);
        }
        for(int h = highness+3; h < 128; h++){
          this.setBlock(2, x, h, y, false);
        }
      }
    }
    
  }
  
  public void decorateExtreme(boolean nat){
    for (int x = 0; x< 16; x++) {
      for (int y = 0; y<16; y++) {
        float nx = ((this.lowestXPos+ x)/50.0);
        float nz = ((this.lowestZPos + y)/50.0);
        float e = 
                  1 * noise(1 * nx, 1 * nz) + 0.5;
            

        e = pow(e, 5);
        int highness = 128-((int)map(e, 0.03125, 7.59375, 10, 127));
        if(highness > WATERLEVEL){
            for(int water = WATERLEVEL; water < highness; water ++){
              this.setBlock(4, x, water, y, false);
            }
        }
        if(highness < WATERLEVEL -6 &&((x<14 &&x > 1) &&(y<14 && y>1)) && nat){
          float random = random(0, 20);
          //println(random);
          if(random < 0.1){
            generateTree(highness, x, y);
            
            
          }
          else if (random<0.4){
            this.setBlock(12, x, highness-1, y, false);
          }
          else if(random<0.8){
            this.setBlock(13, x, highness-1, y, false);
          }
          else if(random <2.8){
            this.setBlock(14, x, highness-1, y, false);
          }
          
        }  
        for (int h = highness; h<highness+3; h++) {
          
          
          if(highness > WATERLEVEL - 6){
            this.setBlock(5, x, h, y, false);
          }
          else this.setBlock(1, x, h, y, false);
        }
        for(int h = highness+3; h < 128; h++){
          this.setBlock(2, x, h, y, false);
        }
      }
      
    }
    
  }
  public void decorateIsland(boolean nat){
    for (int x = 0; x< 16; x++) {
      for (int y = 0; y<16; y++) {
        int highness = 128-((int)map(noise(((this.lowestXPos+ x)/50.0), (this.lowestZPos + y)/50.0), 0, 1, 50, 100));
        if(highness > WATERLEVEL){
            for(int water = WATERLEVEL; water < highness; water ++){
              this.setBlock(4, x, water, y, false);
            }
          }
        if(highness < WATERLEVEL -6 &&((x<14 &&x > 1) &&(y<14 && y>1)) && nat){
          float random = random(0, 20);
          //println(random);
          if(random < 0.3){
            generateTree(highness, x, y);
            
            
          }
          else if (random<0.6){
            this.setBlock(12, x, highness-1, y, false);
          }
          else if(random<1){
            this.setBlock(13, x, highness-1, y, false);
          }
          else if(random <3){
            this.setBlock(14, x, highness-1, y, false);
          }
          
        }  
        
        for (int h = highness; h<highness+3; h++) {
          
          
          if(highness > WATERLEVEL - 6){
            this.setBlock(5, x, h, y, false);
          }
          else if(noise((this.lowestXPos + x)/20.0, (128-h)/20.0, (this.lowestZPos + y)/20.0) > 0.3)this.setBlock(1, x, h, y, false);
        }
        for(int h = highness+3; h < 128; h++){
          if(noise((this.lowestXPos + x)/20.0, (128-h)/20.0, (this.lowestZPos + y)/20.0) > 0.3){
            this.setBlock(2, x, h, y, false);
          }
        }
      }
    }
    this.generateOres();
  }
  public void generateTree(int highness, int x, int y){
    int tree = highness-1;
    for(tree = highness - 1; tree > highness -1 - random(2, 7); tree--){
      if (tree>0)this.setBlock(3, x, tree, y, false);
      
    }
    
    for(int level = 3; level > -1; level--){
      if (level < 2){
        for(int xOff = -2; xOff <3; xOff ++){
          for(int yOff = -2; yOff<3; yOff ++){
            
            this.setBlock(11, x + xOff, tree -level, y + yOff, false);
            
          }
        }
      }
      else{
        
        this.setBlock(11, x + 1, tree -level, y , false);
        
        this.setBlock(11, x - 1, tree -level, y , false);
        
        this.setBlock(11, x , tree -level, y-1 , false);
        
        this.setBlock(11, x , tree -level, y +1, false);
        
        this.setBlock(11, x , tree -level, y, false);
        
      }
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x + 2, tree, y + 2, false);
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x - 2, tree, y + 2, false);
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x + 2, tree, y - 2, false);
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x -2, tree, y - 2, false);
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x + 2, tree - 1, y + 2, false);
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x - 2, tree - 1, y + 2, false);
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x + 2, tree-1, y - 2, false);
    }
    if(random(0, 10) < 4.5){
      this.removeBlock(x -2, tree-1, y - 2, false);
    }
    
  }
  
  public void generateOres(){
    int diamondX = (int)random(15);
    int diamondZ = (int)random(15);
    //println("Diamond generated at " + (this.lowestXPos + diamondX) + ", " + (this.lowestZPos + diamondZ));
    for(int x = 0; x<(int)random(1,3); x++){
      for(int z = 0; z<(int)random(1,3); z++){
        for(int y = 0; y<(int)random(1,3); y++){
          if(this.blocks[diamondX + x][ 116][ diamondZ + z]!= null)this.setBlock(10, diamondX + x, 116 + y, diamondZ + z, false);
        }
      }
    }
    for(int rep = 0; rep < 2; rep++){
      int ironX = (int)random(0,14);
      int ironZ = (int)random(0,14);
      int ironY = (int)random(0, 15);
      //println("Iron generated at " + (this.lowestXPos + ironX) + ", " + (this.lowestZPos + ironZ));
      for(int x = 0; x<(int)random(1,4); x++){
        for(int z = 0; z<(int)random(1,4); z++){
          for(int y = 0; y<(int)    random(1,4); y++){
            if(this.blocks[ironX + x][ 116-ironY + y][ ironZ + z] != null && this.blocks[ironX + x][ 116-ironY + y][ ironZ + z].isTransparent())this.setBlock(17, ironX + x, 116 - ironY+y, ironZ + z, false);
          }
        }
      }
    }
  }
  
  
}
  
  
 
