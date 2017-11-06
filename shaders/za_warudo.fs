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

vec4 ripple(Image texture, vec2 texture_coords)
{
    number d = distance(center, texture_coords);
    number factor = abs((t * 2 - d));

    vec2 new_coords = to_polar(center, texture_coords);
    new_coords[0] *= 1 + factor / 1.5;
    new_coords = to_cartesian(center, new_coords);

    return Texel(texture, new_coords) + factor * 4;
}

vec4 invert_color(vec4 pixel)
{
    return vec4(1 - pixel[0], 1 - pixel[1], 1 - pixel[2], pixel[3]);
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 pixel = Texel(texture, texture_coords);

    number d = distance(center, texture_coords);

    if (d < t * 2.2 && d > t * 1.8) {
        pixel = ripple(texture, texture_coords);
    }

    if (d < t * 2.2) {
        pixel = invert_color(pixel);
    }

    return pixel;
}