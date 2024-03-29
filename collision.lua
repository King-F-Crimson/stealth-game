collision = {}

-- Polygon format is a table containing nth amount of table representing each points.
-- Ex:
-- { { x = 5, y = 6}, { x = 8, y = 3}, { x = 2, y = 5} }
-- It makes a triangle with points on (5, 6), (8, 3), and (2, 5).
-- Line ordering is from start to end, with the end connecting with the start.

function collision.visibility_triangle_and_aabb_rectangle(triangle, rectangle)
    -- Point in geometry test.
    for k, point in pairs(rectangle) do
        if collision.is_point_in_triangle(triangle, point) then
            return true
        end
    end

    local triangle_lines = collision.lines_from_visibility_triangle(triangle)
    local rectangle_lines = collision.lines_from_polygon(rectangle)

    -- Line collision test.
    for k, triangle_line in pairs(triangle_lines) do
        for k, rectangle_line in pairs(rectangle_lines) do
            if lines.lines_intersection(triangle_line, rectangle_line) ~= nil then
                return true
            end
        end
    end

    return false
end

function collision.circle_and_aabb_rectangle(circle, rectangle)
    for k, point in pairs(rectangle) do
        if collision.is_point_in_circle(circle, point) then
            return true
        end
    end

    local rectangle_lines = collision.lines_from_polygon(rectangle)

    for k, line in pairs(rectangle_lines) do
        local point = collision.line_closest_point_to_circle(circle, line)

        if collision.is_point_in_circle(circle, point) then
            return true
        end
    end
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

-- Make only two lines by culling the middle line. The middle line is the one that is parallel to the wall.
function collision.lines_from_visibility_triangle(polygon)
    local lines = {
        {
            start = { x = polygon[1].x, y = polygon[1].y },
            direction = { x = polygon[2].x - polygon[1].x, y = polygon[2].y - polygon[1].y },
        },
        {
            start = { x = polygon[1].x, y = polygon[1].y },
            direction = { x = polygon[3].x - polygon[1].x, y = polygon[3].y - polygon[1].y },
        }
    }

    return lines
end

function collision.is_point_in_triangle(triangle, point)
    local b1, b2, b3

    b1 = collision.sign(point, triangle[1], triangle[2]) < 0.0
    b2 = collision.sign(point, triangle[2], triangle[3]) < 0.0
    b3 = collision.sign(point, triangle[3], triangle[1]) < 0.0

    return (b1 == b2) and (b2 == b3)
end

function collision.sign(p1, p2, p3)
    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y)
end

function collision.is_point_in_circle(circle, point)
    -- Check if point is in range.
    local distance = vector.dist(point.x, point.y, circle.x, circle.y)
    return distance < circle.r
end

function collision.line_closest_point_to_circle(circle, line)
    return { x = 0, y = 0 }
end

-- Currently not used since almost always the entity rectangle will be smaller than the triangle, even if it does not
-- the edges are likely to intersect.
function collision.is_point_in_aabb_rectangle(rectangle, point)

end