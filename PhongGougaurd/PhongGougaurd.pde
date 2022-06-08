import peasy.*;
import controlP5.*;

ControlP5 cp5;
PeasyCam cam;

PShader Phong;
PShader Gouraurd;


float rotationX1=0;
float rotationY1=0;

float rotationX2=0;
float rotationY2=0;

float angleX1 = 1/400.0;
float angleY1 = 1/400.0;

float angleX2 = 1/400.0;
float angleY2 = 1/400.0;

float angle = 1/200.0;

PShape s;


float x1 = 20;
float y1 = 20;

float x2 = 20;
float y2 = 20;

int mode = 0;

void setup(){
  size(1200, 600, P3D); 
  
  cp5 = new ControlP5(this);
  
  s = loadShape("con-armadura.obj");
  
  Phong = loadShader("phongfrag.glsl", "phongvert.glsl");
  Gouraurd = loadShader("gouraurdfrag.glsl", "gouraurdvert.glsl");
  
  
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  cam.setDistance(400);
  cam.setYawRotationMode(); 
  
   
     
}



void draw(){
  background(20, 20, 20, 100); 
  
  
  if (mode == 0) shader(Gouraurd);
  if (mode == 1) shader(Phong);

  pointLight(255, 255, 255, 300, 100, 1000); 
  
  
  translate(-width/2, -height/2, 0); 

  
  //Object 1 =====================================
  pushMatrix();
  translate(width/2-150, height/2, 0);
  rotateX(rotationX1*PI*2);
  rotateY(rotationY1*PI*2);  
    
  shape(s, 0, 0); 
  popMatrix();
  
  
  
  
  //Object 2 =====================================
  pushMatrix();
  translate(width/2+150, height/2, 0);
  rotateX(rotationX2*PI*2);
  rotateY(rotationY2*PI*2); 
   
  box(80); 
  popMatrix();

  
  
  
  rotationX1 =  (rotationX1 + angle*x1/100)%1;
  rotationY1 =  (rotationY1 + angle*y1/100)%1;  
  
  rotationX2 =  (rotationX2 + angle*x2/100)%1;
  rotationY2 =  (rotationY2 + angle*y2/100)%1;  
  
  

  
   
}



void keyPressed() {

  if (key=='1') mode = 0; 
  if (key=='2') mode = 1;
}