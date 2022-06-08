PShader SpotLight;
PShape s;

float angle = 0;

void setup(){
  size(1200, 600, P3D); 
  s = loadShape("con-armadura.obj");
  
  SpotLight = loadShader("SpotLightfrag.glsl", "SpotLightvert.glsl");
  
  
}






void draw(){
  background(20, 20, 20, 100);

  shader(SpotLight);
  
  spotLight(255, 255, 255, width/2, 0, 360, sin(angle*2*PI*2)*0.1, 1, cos(angle*2*PI)*0.1, PI/32, 2);  
  spotLight(255, 255, 255, width/2, 0, 360, sin(angle*2*PI)*-0.1, 1, cos(angle*2*PI)*0.1, PI/32, 2);   

  angle=(angle + 0.001)%1;




  translate(width/2, height-240, 360); 
  rotateZ(PI);
  rotateY(PI/3);  
  
  shape(s, 0, 0); 
   
  
}