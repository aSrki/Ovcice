class Sheep{
 
  public int colour;
  public int age;
  public int alive;
  
  
  public Sheep(){
      colour = int(random(200,255)); 
      alive = 1;
  } 
  public Sheep(int parent1, int parent2){
      colour = int((parent1 + parent2)/2);
      alive = 1;
  }
  
  public void  drawSheep(int x, int y){
      
    if(alive == 1){
      rect(x,y,50,50);
      fill(colour);
    }
  }
  

}

class Wolf{
  
  public void eat(Sheep[] ovce){
       
      for(int i = 0; i<100; ++i){
        for(int j = 0; j<100; ++j){
          if(ovce[i].colour > ovce[j].colour){
            Sheep temp = ovce[i];
            ovce[i]=ovce[j];
            ovce[j]=temp;
          }
        }
      }
   
    for(int i = 0 ; i< 15; i++){
      ovce[i].alive = 0;
    }
    
    int a=0,b=0,c=0,d=0,e=0;
    
    while(!((a!=b) && (b!=c) && (c!=d) && (d!=e))){
        a = int(random(15,100));
        b = int(random(15,100));
        c = int(random(15,100));
        d = int(random(15,100));
        e = int(random(15,100));
    }
    
    ovce[a].alive = 0;
    ovce[b].alive = 0;
    ovce[c].alive = 0;
    ovce[d].alive = 0;
    ovce[e].alive = 0;
    
  }

}

public void reproduce(Sheep[] ovcice){

    for(int i = 0 ; i< 100; i++){
      if(ovcice[i].alive == 0){
        
        int a=0,b=0;
        
        while(!(ovcice[a].alive == 1 && ovcice[b].alive == 1)){
        
             a = int(random(0,100));
             b = int(random(0,100));
        
        }
        
        ovcice[i] = new Sheep(ovcice[a].colour , ovcice[b].colour);
       
        if(ovcice[i].colour < 250){
        ovcice[i].colour += int(random(-20,20));
        }
        
      }
    }
  
}

Sheep[] stado;
Wolf vuk;
int generacija = 1;

void setup(){
  
    stado = new Sheep[100];
    vuk = new Wolf();
    
    for(int i = 0; i<100; i++){
      stado[i] = new Sheep();
    } 
    

      
    size(500,500);
    background(255,57,45);

  
}

void randomize(Sheep[] ovcice){

    int index;
    Sheep smena;
  
    for(int i= 0; i < 100; i++){
    
        index = int(random(0,100));
        smena = ovcice[i];
        ovcice[i] = ovcice[index];
        ovcice[index] = smena;
      
    }

}

void draw(){
  
  String tekst = "Generacija : " + generacija;
 
  delay(100);
  for(int i = 0 ; i< 100; ++i){
      stado[i].drawSheep(i%10*50 , floor(i/10)*50);      
  }
  vuk.eat(stado);
  randomize(stado);
  reproduce(stado);
  
  surface.setTitle(tekst);
  generacija++;
    
  
}
