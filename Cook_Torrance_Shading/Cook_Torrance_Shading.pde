PShader Cook_Torrance;
PShape s;
float scroll;


void setup(){
  size(1200, 600, P3D); 
  
  s = loadShape("con-armadura.obj");    
  Cook_Torrance = loadShader("cook−torrancefrag.glsl", "cook−torrancevert.glsl");
  
}


void draw(){
  background(120, 120, 120, 100);
  
  shader(Cook_Torrance);  
  pointLight(255, 255, 255, mouseX, mouseY, scroll*100+480);   

  
  translate(width/2, height-240, 360);  
  rotateZ(PI);
  rotateY(PI/3);
  
  shape(s);
  
  
}


void mouseWheel(MouseEvent event) {
  scroll += event.getCount();  
}