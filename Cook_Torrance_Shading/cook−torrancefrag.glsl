#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec3 ecPosition;
varying vec3 viewDir;
varying vec3 halfwayDir;


float GeometrySchlickGGX(float NdotV, float k)
{
    float nom   = NdotV;
    float denom = NdotV * (1.0 - k) + k;
  
    return nom / denom;
}
  
float GeometrySmith(vec3 N, vec3 V, vec3 L, float k)
{
    float NdotV = max(dot(N, V), 0.0);
    float NdotL = max(dot(N, L), 0.0);
    float ggx1 = GeometrySchlickGGX(NdotV, k);
    float ggx2 = GeometrySchlickGGX(NdotL, k);
  
    return ggx1 * ggx2;
}


vec3 fresnelSchlick(float cosTheta, vec3 F0)
{
    return F0 + (1.0 - F0) * pow(1.0 - cosTheta, 5.0);
}


float DistributionGGX(vec3 N, vec3 H, float a)
{
    float a2     = a*a;
    float NdotH  = max(dot(N, H), 0.0);
    float NdotH2 = NdotH*NdotH;
	
    float nom    = a2;
    float denom  = (NdotH2 * (a2 - 1.0) + 1.0);
    denom        = 3.14159 * denom * denom;
	
    return nom / denom;
}

void main() {
  vec3 direction = normalize(lightDir);
  vec3 normal = normalize(ecNormal);


  float a = 0.3;

  float GGX = DistributionGGX(normal, halfwayDir, a);  

  float k = pow(a+1.0, 2)/8.0;
  float geometry = GeometrySmith(normal, viewDir, direction, k);

  float cosTheta = dot(direction, normal);  
  vec3 F0 = vec3(0.6, 0.5, 0.3);

  vec3 ratio = fresnelSchlick(cosTheta, F0);

  float light = GGX*geometry*ratio[0];



  float lightSum = light;


  gl_FragColor = vec4(lightSum , lightSum , lightSum , 1) * vertColor;

}

