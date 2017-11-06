extern number t;
extern vec2 center;

number distance(vec2 point_1, vec2 point_2)
{
    return sqrt(pow(point_1[0] - point_2[0], 2) + pow(point_1[1] - point_2[1], 2));
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 texturecolor = Texel(texture, texture_coords);

    if (distance(center, texture_coords) < 0.25) {
        return vec4(255, 255, 255, 0);
    }

    return texturecolor * color * (t / t) * (distance(center, texture_coords) / distance(center, texture_coords));
}