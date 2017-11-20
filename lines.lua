lines = {}

-- Ray is an unending line from one point heading to a direction.
-- Line is an ending line from one point to another point.
-- Function returns nil if there's no intersection.
function lines.find_intersection(ray, line)
    -- No intersection if the ray and line are paralel.
    if lines.are_lines_paralel(ray, line) then
        return nil
    else
        -- Calculation can be found on http://ncase.me/sight-and-light/
        local line_distance = (ray.direction.x * (line.start.y - ray.start.y) - ray.direction.y * (line.start.x - ray.start.x)) / 
        ((ray.direction.y * line.direction.x) - (ray.direction.x * line.direction.y))

        local ray_distance = (line.start.x + line.direction.x * line_distance - ray.start.x) / ray.direction.x

        -- Does not count as an intersection if the intersection is outside the line (not 0 < line_distance < 1)
        -- or if the intersection is on the opposite direction of the ray (not 0 < ray_distance)
        -- tostring comparison is for when somehow the equation '1' does not equal to '1', probably caused by floating point error.
        if line_distance >= 0 and (line_distance <= 1 or tostring(line_distance) == "1") and ray_distance >= 0 then
            local i_x, i_y = ray.start.x + ray.direction.x * ray_distance, ray.start.y + ray.direction.y * ray_distance

            return i_x, i_y, ray_distance
        else
            return nil
        end
    end
end

function lines.are_lines_paralel(ray, line)
    return ray.direction.y / ray.direction.x == line.direction.y / line.direction.x
end