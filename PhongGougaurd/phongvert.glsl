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
  vertColor = color;
}