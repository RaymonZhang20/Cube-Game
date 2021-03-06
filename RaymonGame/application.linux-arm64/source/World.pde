//Class for handling the world, such as chunk loading
//import java.util.*;
public class World {
  public ArrayList<Chunk> chunkMemory;



  public int size;
  public String status;
  PImage texture = loadImage("/textures/texture_atlas.png");

  Hashtable<Integer, PVector[]> textureCoords = new Hashtable<Integer, PVector[]>();

  // coords are 1 + 130(x-1), 1 + 130(y-1)





  public World(int size) {

    loadStatus = "Creating world";
    println(loadStatus);
    this.size = size;
    

    chunkMemory = new ArrayList<Chunk>();

    

    textureCoords.put(1, new PVector[]{new PVector(0, 0), new PVector (16, 0), new PVector(32, 0)});//grass
    textureCoords.put(2, new PVector[]{new PVector(48, 0), new PVector (48, 0), new PVector(48, 0)});//stone
    textureCoords.put(3, new PVector[]{new PVector(80, 0), new PVector(64, 0), new PVector(80, 0)});//log
    textureCoords.put(4, new PVector[]{new PVector(96, 0), new PVector(96, 0), new PVector(96, 0)});//water
    textureCoords.put(5, new PVector[]{new PVector(16, 16), new PVector(16, 16), new PVector(16, 16)});//sand
    textureCoords.put(6, new PVector[]{new PVector(32, 16), new PVector(32, 16), new PVector(32, 16)});//oakplank
    textureCoords.put(7, new PVector[]{new PVector(48, 16), new PVector(64, 16), new PVector(32, 0)});//snow
    textureCoords.put(8, new PVector[]{new PVector(80, 16), new PVector(80, 16), new PVector(80, 16)});//gravel
    textureCoords.put(9, new PVector[]{new PVector(176, 0), new PVector(176, 0), new PVector(176, 0)});//lava
    textureCoords.put(10, new PVector[]{new PVector(0, 16), new PVector (0, 16), new PVector(0, 16)});//diamondore
    textureCoords.put(11, new PVector[]{new PVector(96, 16), new PVector(96, 16), new PVector(96, 16)});//leaves
    textureCoords.put(12, new PVector[]{new PVector(112, 0), new PVector(112, 0), new PVector(112, 0)});//poppy flower
    textureCoords.put(13, new PVector[]{new PVector(128, 0), new PVector(128, 0), new PVector(128, 0)});//dandelion flower
    textureCoords.put(14, new PVector[]{new PVector(144, 0), new PVector(144, 0), new PVector(144, 0)});//grass flower
    textureCoords.put(15, new PVector[]{new PVector(160, 0), new PVector(160, 0), new PVector(160, 0)});//cobblestone
    textureCoords.put(16, new PVector[]{new PVector(32, 0), new PVector (32, 0), new PVector(32, 0)});//dirt
    textureCoords.put(17, new PVector[]{new PVector(0, 32), new PVector (0, 32), new PVector(0, 32)});//ironore
    textureCoords.put(18, new PVector[]{new PVector(16, 32), new PVector (16, 32), new PVector(16, 32)});//goldore
    textureCoords.put(19, new PVector[]{new PVector(112, 16), new PVector (112, 16), new PVector(112, 16)});//blueorchid
    textureCoords.put(20, new PVector[]{new PVector(128, 16), new PVector(128, 16), new PVector(128, 16)});//daisy
    textureCoords.put(21, new PVector[]{new PVector(32, 32), new PVector (32, 32), new PVector(32, 32)});//whiteconcretepowder
    textureCoords.put(22, new PVector[]{new PVector(48, 32), new PVector (48, 32), new PVector(48, 32)});//blackconcretepowder
    textureCoords.put(23, new PVector[]{new PVector(64, 32), new PVector (64, 32), new PVector(64, 32)});//redconcretepowder
    textureCoords.put(24, new PVector[]{new PVector(80, 32), new PVector (80, 32), new PVector(80, 32)});//blueconcretepowder
    textureCoords.put(25, new PVector[]{new PVector(96, 32), new PVector (96, 32), new PVector(96, 32)});//yellowconcretepowder

    
    //for (int x = 0;x < chunkMemory.length; x++){
    //   for (int y = 0;y < chunkMemory.length; y++){
    //     Chunk c = chunkMemory[x][y];
    //     for (int a = 0;a<c.blocks.length;a++){
    //       for(int b = 0;b<c.blocks[a][0].length;b++){
    //         if(heightMap[a + x*16][b + y*16] > 86){
    //           for(int h = 86; h<heightMap[a + x*16][b + y*16];h++){
    //             c.setBlock(4, a, h, b, false);
    //           }
    //         }
    //         for(int h = heightMap[a + x*16][b + y*16]; h<heightMap[a + x*16][b + y*16]+4;h++){


    //           if(heightMap[a + x*16][b + y*16] <38){
    //             c.setBlock(7, a, h, b, false);
    //           }
    //           else if(heightMap[a + x*16][b + y*16] <55){
    //             c.setBlock(8, a, h, b, false);
    //           }
    //           else if(heightMap[a + x*16][b + y*16] <81){
    //             c.setBlock(1, a, h, b, false);
    //           }

    //           else c.setBlock(5, a, h, b, false);

    //             //println(noise(((x*16) + a)/10, (128-h)/10, ((y*16) + b)/10));



    //         }
    //         for(int h = heightMap[a + x*16][b + y*16]+4; h<128;h++){
    //           if (caveMap[a + x*16][h][b + y*16] > 0.25){

    //             if (caveMap[a + x*16][h][b + y*16] > 0.2699 && caveMap[a + x*16][h][b + y*16] < 0.27){
    //               c.setBlock(10, a, h, b, false);
    //             }
    //             else{

    //               c.setBlock(2, a, h, b, false);
    //             }
    //             //println(noise(((x*16) + a)/10, (128-h)/10, ((y*16) + b)/10));
    //           }


  }

  public void drawWorld() {
    ArrayList<Chunk> chunks= new ArrayList<Chunk>(this.chunkMemory);
    
    for (Chunk x : chunks) {
      
      x.betterDrawChunk();
      
    }
  }
  
  public PImage getTexture() {
    return this.texture;
  }

  public Chunk getChunkAt(int x, int z) {
    //println(this.chunkMemory);
    ArrayList<Chunk> chunks= new ArrayList<Chunk>(this.chunkMemory);
    for(Chunk ch: chunks){
      
      if(ch.lowestZPos == z*16 && ch.lowestXPos == x*16){

        return ch;
        
      }
    }

    return null;

  }
  
  public Block getBlockAt(int x, int y, int z){
    
    Chunk chunk = this.getChunkAt(floor(x/16.0), floor(z/16.0));
    try{
      return chunk.blocks[x-floor(x/16.0)*16][y][z-floor(z/16.0)*16];
    }
    catch(Exception e){
      //println((x-floor(x/16.0)*16) + ", " + y + ", " + (z-floor(z/16.0)*16));
      return null;
    }
      
    
  }
  
  public int getHighestBlockAt(int x, int z){
    return 128-((int)map(noise(((x)/75.0), (z)/75.0), 0, 1, 5, 100));
  }
}



public void generateMeshes() {
  for (Chunk c : c.chunkMemory) {
    c.betterGenerateMesh();
  }
}

public void checkChunks() {

  for (;; delay(50)) {
    

    ArrayList<Chunk> regenerate= new ArrayList<Chunk>();
    //println(regenerate);
    int px = floor( player.xPosition/16) ;
    int pz = floor( player.zPosition/16) ;


    ArrayList<Chunk> newVersion = new ArrayList<Chunk>(c.chunkMemory);

    for (Chunk chunk : newVersion) {
      if (abs(chunk.lowestXPos/16 - px) + abs(chunk.lowestZPos/16 - pz) > (WORLDSIZE-1)/2) {
        c.chunkMemory.remove(chunk);
        //chunk  = null;
      }
    }
    

    for (int s = 0; s<(WORLDSIZE+1)/2; s++) {
      for (int x = 0; x<s+1; x++) {
        int y = s-x;
        
        Chunk dummy = c.getChunkAt((px) + x, (pz)+y) ;
        if(dummy== null){
          Chunk newChunk = new Chunk((px + x)*16, 0, (pz + y)*16, c);
          decorateChunk(newChunk);

          regenerate.add(newChunk);
          c.chunkMemory.add(newChunk);
          //println(regenerate);


          Chunk chunk = c.getChunkAt(px+x, pz+y-1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px+x, pz+y+1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px+x+1, pz+y);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px+x-1, pz+y);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
        }
      }

      for (int x = 0; x<s+1; x++) {
        int y = s-x;
        
        Chunk dummy = c.getChunkAt((px) + y, (pz)-x) ;
        if(dummy== null){
          Chunk newChunk = new Chunk((px + y)*16, 0, (pz -x)*16, c);
          decorateChunk(newChunk);

          regenerate.add(newChunk);
          c.chunkMemory.add(newChunk);
          //println(regenerate);


          Chunk chunk = c.getChunkAt(px+y, pz-x-1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px+y, pz-x+1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px+y+1, pz-x);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px+y-1, pz-x);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
        }
      }

      for (int x = 0; x<s+1; x++) {
        int y = s-x;
        
        Chunk dummy = c.getChunkAt((px) - x, (pz)-y) ;
        if(dummy== null){
          Chunk newChunk = new Chunk((px - x)*16, 0, (pz - y)*16, c);
          decorateChunk(newChunk);

          regenerate.add(newChunk);
          c.chunkMemory.add(newChunk);
          //println(regenerate);


          Chunk chunk = c.getChunkAt(px-x, pz-y-1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px-x, pz-y+1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px-x+1, pz-y);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px-x-1, pz-y);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
        }
      }

      for (int x = 0; x<s+1; x++) {
        int y = s-x;
        
        Chunk dummy = c.getChunkAt((px) - y, (pz)+x) ;
        if(dummy== null){
          Chunk newChunk = new Chunk((px - y)*16, 0, (pz +x)*16, c);
          decorateChunk(newChunk);

          regenerate.add(newChunk);
          c.chunkMemory.add(newChunk);
          //println(regenerate);


          Chunk chunk = c.getChunkAt(px-y, pz+x-1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px-y, pz+x+1);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px-y+1, pz+x);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
          chunk = c.getChunkAt(px-y-1, pz+x);
          if(chunk != null){  
            if (! regenerate.contains(chunk)) {
              regenerate.add(chunk);
            }
          }
          
        }
      }

    }

    for (Chunk getRegenerated : regenerate) {
      getRegenerated.betterGenerateMesh();
      //println(getRegenerated);
    }
    //println("-----------");
  }
}
