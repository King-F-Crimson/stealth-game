extern number t;
extern vec2 center;

number distance(vec2 point_1, vec2 point_2)
{
    return sqrt(pow(point_1[0] - point_2[0], 2) + pow(point_1[1] - point_2[1], 2));
}

vec2 to_polar(vec2 origin, vec2 point)
{
    return vec2(distance(origin, point), atan(point[1] - origin[1], point[0] - origin[0]));
}

vec2 to_cartesian(vec2 origin, vec2 point)
{
    vec2 vector = vec2(point[0] * cos(point[1]), point[0] * sin(point[1]));

    return vector + origin;
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    if (distance(center, texture_coords) < t) {
        vec2 new_coords = to_polar(center, texture_coords);
        new_coords[0] *= t;
        new_coords = to_cartesian(center, new_coords);

        return Texel(texture, new_coords);
    }

    return Texel(texture, texture_coords);
}