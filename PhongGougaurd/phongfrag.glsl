#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 lightDir;
varying vec3 vertPosition;

void main() {
  vec3 direction = normalize(lightDir);
  vec3 normal = normalize(vertNormal);
  
  float intensity = max(0.0, dot(direction, normal));

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
  float specularCoefficient = 0.5;

  float lightSum = intensity*reflectionCoefficient + specular*specularCoefficient + ambient*ambientCoefficient;


  gl_FragColor = vec4(lightSum , lightSum , lightSum , 1) * vertColor;

}