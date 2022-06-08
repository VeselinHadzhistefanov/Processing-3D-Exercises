uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec4 lightPosition[8];
uniform vec3 lightNormal[8];
uniform vec2 lightSpot[8];
uniform int lightCount;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertPosition;
varying vec3 lightDir[8];
varying vec3 spotDir[8];

void main() {
  gl_Position = transform * position;
  vertPosition = vec3(modelview * position);
  vertNormal = normalize(normalMatrix * normal);

  for(int i = 0; i < lightCount; i++){
    
    lightDir[i] = normalize(lightPosition[i].xyz - vertPosition);
    spotDir[i] = normalize(normalMatrix * lightNormal[i]);


  }
  
  vertColor = color;
}