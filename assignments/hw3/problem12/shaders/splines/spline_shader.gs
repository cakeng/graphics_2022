#version 330 core
#define N 20
layout (lines_adjacency) in;
layout (line_strip, max_vertices = N) out;

out vec3 fColor;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void BezierLine(float t)
{
    vec4 T = vec4(t*t*t, t*t, t, 1);
    mat4 B = mat4(vec4(-1,3,-3,1), vec4(3,-6,3,0), vec4(-3,3,0,0), vec4(1,0,0,0));
    mat4x3 G;
    for(int i=0; i<4; i++){
        vec4 wp = model * gl_in[i].gl_Position;
        G[i][0] = wp.x;
        G[i][1] = wp.y;
        G[i][2] = wp.z;
    }
    fColor = vec3(t,1,1-t);
    vec4 worldV = vec4(G * B * T, 1.0f);
    gl_Position = worldV;
    EmitVertex();
}

void main() {    
    for(int i=0; i<N; i++){
        BezierLine(float(i)/(N-1));
    }
    EndPrimitive();
}