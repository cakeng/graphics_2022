#version 330 core
out vec4 FragColor;

struct Material {
    sampler2D diffuseSampler;
    sampler2D specularSampler;
    sampler2D normalSampler;
    float shininess;
}; 

uniform sampler2D shadowMap;

struct Light {
    vec3 dir;
    vec3 color; // this is I_d (I_s = I_d, I_a = 0.3 * I_d)
};

uniform vec3 viewPos;
uniform Material material;
uniform Light light;

in vec3 FragPos;  
in vec3 Normal;  
in vec2 TexCoords;
in mat3 TBN;
in vec4 FragPosLightSpace;

uniform float useNormalMap;
uniform float useSpecularMap;
uniform float useShadow;
uniform float useLighting;
uniform float usePCF;
uniform float useCSM;

vec2 poissonDisk[16] = vec2[]( 
   vec2( -0.94201624, -0.39906216 ), 
   vec2( 0.94558609, -0.76890725 ), 
   vec2( -0.094184101, -0.92938870 ), 
   vec2( 0.34495938, 0.29387760 ), 
   vec2( -0.91588581, 0.45771432 ), 
   vec2( -0.81544232, -0.87912464 ), 
   vec2( -0.38277543, 0.27676845 ), 
   vec2( 0.97484398, 0.75648379 ), 
   vec2( 0.44323325, -0.97511554 ), 
   vec2( 0.53742981, -0.47373420 ), 
   vec2( -0.26496911, -0.41893023 ), 
   vec2( 0.79197514, 0.19090188 ), 
   vec2( -0.24188840, 0.99706507 ), 
   vec2( -0.81409955, 0.91437590 ), 
   vec2( 0.19984126, 0.78641367 ), 
   vec2( 0.14383161, -0.14100790 ) 
);

float random(vec3 seed, int i){
	vec4 seed4 = vec4(seed,i);
	float dot_product = dot(seed4, vec4(12.9898,78.233,45.164,94.673));
	return fract(sin(dot_product) * 43758.5453);
}

float ShadowCalculation(vec4 fragPosLightSpace)
{
    float bias = 0.004;  
    bias = max(0.0002 * (10.0 + 10*dot(Normal, light.dir)), 0.0004);  
    // perform perspective divide
    vec3 projCoords = fragPosLightSpace.xyz / fragPosLightSpace.w;
    // transform to [0,1] range
    projCoords = projCoords * 0.5 + 0.5;
    // get closest depth value from light's perspective (using [0,1] range fragPosLight as coords)
    float closestDepth = texture(shadowMap, projCoords.xy).r; 
    // get depth of current fragment from light's perspective
    float currentDepth = projCoords.z;
    // check whether current frag pos is in shadow
    float shadow = currentDepth - bias > closestDepth ? 1.0 : 0.0;

    //PCF
    if (usePCF > 0.5f)
    {
        shadow = 0.0f;
        vec2 texelSize = 1.0 / textureSize(shadowMap, 0);
        // for(int x = -1; x <= 1; ++x)
        // {
        //     for(int y = -1; y <= 1; ++y)
        //     {
        //         float pcfDepth = texture(shadowMap, projCoords.xy + vec2(x, y) * texelSize).r; 
        //         shadow += currentDepth - bias > pcfDepth ? (1.0/9.0) : 0.0;        
        //     }    
        // }
        for(int i = 0; i < 12; i++)
        {
            int index = int(16.0*random(gl_FragCoord.xyy, i))%16;
            float pcfDepth = texture(shadowMap, projCoords.xy + poissonDisk[index]/0.2 * texelSize).r; 
            shadow += currentDepth - bias > pcfDepth ? (1.0/12.0) : 0.0;      
        } 
    }

    return shadow;
} 

void main()
{
	vec3 color = texture(material.diffuseSampler, TexCoords).rgb;
 
    // on-off by key 3 (useLighting). 
    // if useLighting is 0, return diffuse value without considering any lighting.(DO NOT CHANGE)
	if (useLighting < 0.5f){
        FragColor = vec4(color, 1.0); 
        return; 
    }

    // ambient
    vec3 ambient = light.color * 0.3 * texture(material.diffuseSampler, TexCoords).rgb;
  	if (ambient[0] < 0.0f)
    {
        ambient[0] = 0.0;
    }
    if (ambient[1] < 0.0f)
    {
        ambient[1] = 0.0;
    }
    if (ambient[2] < 0.0f)
    {
        ambient[2] = 0.0;
    }
    // on-off by key 2 (useShadow).
    // calculate shadow
    // if useShadow is 0, do not consider shadow.
    // if useShadow is 1, consider shadow.
    float shadow = 0.0f;
    if(useShadow > 0.5f)
	{
        shadow = ShadowCalculation(FragPosLightSpace);       
	}


    // on-off by key 1 (useNormalMap).
    // if model does not have a normal map, this should be always 0.
    // if useNormalMap is 0, we use a geometric normal as a surface normal.
    // if useNormalMap is 1, we use a geometric normal altered by normal map as a surface normal.
    vec3 norm = normalize(Normal);
	if(useNormalMap > 0.5f)
	{
        vec3 normMap = texture(material.normalSampler, TexCoords).rgb;
        norm = normalize(TBN * (normMap * 2.0 - 1.0)); 
	}
    // diffuse 
    
    vec3 lightDir = light.dir;
    float diff = max(dot(norm, -lightDir), 0.0);
    vec3 diffuse = light.color * diff * texture(material.diffuseSampler, TexCoords).rgb;  
    if (diffuse[0] < 0.0f)
    {
        diffuse[0] = 0.0;
    }
    if (diffuse[1] < 0.0f)
    {
        diffuse[1] = 0.0;
    }
    if (diffuse[2] < 0.0f)
    {
        diffuse[2] = 0.0;
    }
    // if model does not have a specular map, this should be always 0.
    // if useSpecularMap is 0, ignore specular lighting.
    // if useSpecularMap is 1, calculate specular lighting.
    vec3 specular = vec3(0.0);
	if(useSpecularMap > 0.5f && (diffuse[0] > 0.0 || diffuse[1] > 0.0 || diffuse[2] > 0.0))
	{
        //use only red channel of specularSampler as a reflectance coefficient(k_s).
        vec3 viewDir = normalize(viewPos - FragPos);
        vec3 reflectDir = reflect(lightDir, norm);  
        float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);
        specular = light.color * spec * texture(material.specularSampler, TexCoords)[0];  
	}
    if (specular[0] < 0.0f)
    {
        specular[0] = 0.0;
    }
    if (specular[1] < 0.0f)
    {
        specular[1] = 0.0;
    }
    if (specular[2] < 0.0f)
    {
        specular[2] = 0.0;
    }

    vec3 result = ambient + (1.0 - shadow) * (diffuse + specular);
    FragColor = vec4(result, 1.0);
    return;
}