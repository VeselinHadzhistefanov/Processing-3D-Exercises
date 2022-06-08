#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec3 ecPosition;

void main() {  

  gl_FragColor = vec4(1, 1, 1, 1) * vertColor;

}