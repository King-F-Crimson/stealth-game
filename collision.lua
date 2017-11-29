collision = {}

-- Polygon format is a table containing nth amount of table representing each points.
-- Ex:
-- { { x = 5, y = 6}, { x = 8, y = 3}, { x = 2, y = 5} }
-- It makes a triangle with points on (5, 6), (8, 3), and (2, 5).
-- Line ordering is from start to end, with the end connecting with the start.

function collision.triangle_and_aabb_rectangle(triangle, rectangle)
    local triangle_lines = collision.lines_from_polygon(triangle)
    local rectangle_lines = collision.lines_from_polygon(rectangle)

    local collides = false

    for k, triangle_line in pairs(triangle_lines) do
        for k, rectangle_line in pairs(rectangle_lines) do
            if lines.lines_intersection(triangle_line, rectangle_line) ~= nil then
                collides = true
            end
        end
    end

    return collides
end

function collision.lines_from_polygon(polygon)
    local lines = {}

    for k, point in pairs(polygon) do
        local next_point

        if k == #polygon then
            next_point = polygon[1]
        else
            next_point = polygon[k + 1]
        end

        local line = {
            start = { x = point.x, y = point.y },
            direction = { x = next_point.x - point.x, y = next_point.y - point.y }
        }

        table.insert(lines, line)
    end 

    return lines
end

function collision.is_point_in_triangle(triangle, point)

end