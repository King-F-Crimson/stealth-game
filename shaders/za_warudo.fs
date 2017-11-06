extern number t;
extern vec2 center;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 texturecolor = Texel(texture, texture_coords);
    return texturecolor * color * vec4(0.5, 0.5, 0.5, 1) * t * center[0];
}