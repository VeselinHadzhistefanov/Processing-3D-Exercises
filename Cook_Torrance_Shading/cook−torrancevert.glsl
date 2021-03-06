uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec4 lightPosition;
uniform vec3 lightNormal;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 ecPosition;
varying vec3 lightDir;
varying vec3 viewDir;
varying vec3 halfwayDir;

void main() {
  gl_Position = transform * position;
  ecPosition = vec3(modelview * position);

  ecNormal = normalize(normalMatrix * normal);

  lightDir = normalize(lightPosition.xyz - ecPosition);
  viewDir  = normalize(vec3(modelview) - ecPosition);
  halfwayDir = normalize(lightDir + viewDir);

  vertColor = color;
}