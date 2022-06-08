#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform int lightCount;
uniform vec2 lightSpot[8];

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertPosition;
varying vec3 lightDir[8];
varying vec3 spotDir[8];


void main() {  

  float ambientCoefficient = 0.1;
  float reflectionCoefficient = 0.8;
  float specularCoefficient = 0.6;

  float lightSum = 0;
  
  for(int i = 0; i < lightCount; i++){
    
  
    vec3 direction = normalize(lightDir[i]);
    vec3 normal = normalize(vertNormal);

    float angle = dot(normalize(spotDir[i]), direction);
    
    float ambient = 0.0;
    float specular = 0.0;
    float intensity = 0.0;

    if (angle > lightSpot[i][0]) {


      intensity = max(0.0, dot(lightDir[i], vertNormal));
      ambient = 1.0;

      if(intensity > 0.0) {
        vec3 reflected = reflect(-direction, normal);   
        vec3 position = normalize(-vertPosition);

        float specAngle = max(dot(reflected, position), 0.0);
        specular = pow(specAngle, 1.0);

      }
    }

    lightSum += intensity*reflectionCoefficient + specular*specularCoefficient + ambient*ambientCoefficient;
  }




  gl_FragColor = vec4(lightSum, lightSum, lightSum, 1) * vertColor;




}