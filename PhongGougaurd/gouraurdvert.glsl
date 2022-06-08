uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec4 lightPosition;
uniform vec3 lightNormal;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertPosition;
varying vec3 lightDir;

void main() {
  gl_Position = transform * position;
  vertPosition = vec3(modelview * position);
  vertNormal = normalize(normalMatrix * normal);

  lightDir = normalize(lightPosition.xyz - vertPosition);
  
  vec3 direction = normalize(lightDir);  

  float intensity = max(0.0, dot(lightDir, vertNormal));

  float specular = 0.0;
  float ambient = 1.0;

  if(intensity > 0.0) {
    vec3 reflected = reflect(-direction, normal);   
    vec3 position = normalize(-vertPosition);

    float specAngle = max(dot(reflected, position), 0.0);
    specular = pow(specAngle, 1.0);

  }


  float ambientCoefficient = 0.1;
  float reflectionCoefficient = 0.8;
  float specularCoefficient = 0.8;
  
  float lightSum = intensity*reflectionCoefficient + specular*specularCoefficient + ambient*ambientCoefficient;

  vertColor = vec4(lightSum, lightSum, lightSum, 1.0) * color;
}