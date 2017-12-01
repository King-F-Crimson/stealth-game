line_of_sight = {}

function line_of_sight:create(game, entity, field_of_view, distance)
    local object = {
        game = game,
        entity = entity,
        fov = field_of_view,
        distance = distance,
        color = {255, 255, 80, 63},
    }
    setmetatable(object, {__index = self} )

    return object
end

-- Potential bug if the entity does collide with the ray and with the arc, but at different point.
-- Ex: a part of the entity is covered behind wall so it does not collides with the visibility polygon,
-- however it is in part of the visibility arc, so it does collide with the arc.
-- And since another part of the entity is not covered by the wall, it collides with the visiblity polygon.
-- A solution is to cull all angles outside the arc and add two more angles at the point which the arc ends.
function line_of_sight:get_entities_in_sight()
    local entities_in_sight = {}

    local visibility_polygons = self:get_visibility_polygons()
    local triangles = {}

    for k, polygon in pairs(visibility_polygons) do
        table.insert(triangles, {
            { x = polygon[1], y = polygon[2] },
            { x = polygon[3], y = polygon[4] },
            { x = polygon[5], y = polygon[6] },
        })
    end

    local center = self.entity:get_center()

    local visibility_arc = {
        x = center.x,
        y = center.y,
        r = self.distance,
        direction = self.entity.direction,
        fov = self.fov,
    }

    for k, entity in pairs(self.game.world.entities) do
        local entity_rect = {
            { x = entity.x, y = entity.y },
            { x = entity.x + entity.w, y = entity.y },
            { x = entity.x + entity.w, y = entity.y + entity.h },
            { x = entity.x, y = entity.y + entity.h },
        }

        local collides = false
        -- Check collision with the visiblity arc first since it is the fastest.
        local collides_with_arc = collision.arc_and_aabb_rectangle(visibility_arc, entity_rect)

        -- Only check with visibility polygons if it is in the arc to save time.
        if collides_with_arc then
            for k, triangle in pairs(triangles) do
                if collision.visibility_triangle_and_aabb_rectangle(triangle, entity_rect) then
                    collides = true
                    break
                end
            end
        end

        if collides then
            table.insert(entities_in_sight, entity)
        end
    end

    return entities_in_sight
end

function line_of_sight:get_visibility_polygons()
    local tile_map = self.game.world.tile_map
    local walls = tile_map:get_walls()
    local center = self.entity:get_center()
    local angles = tile_map:get_wall_ending_angles(center)
    table.sort(angles)

    local end_points = {}

    -- Cast a ray to every point where a wall starts or ends.
    for k, angle in pairs(angles) do
        -- Cast angles with a slight derivation to hit the wall behind corners.
        table.insert(end_points, self:cast_ray(center, angle - 0.000001, walls))
        table.insert(end_points, self:cast_ray(center, angle + 0.000001, walls))
    end

    local polygons = {}

    -- Only connects angles that are not the result from the slight deviation (ex: not connecting 1.000001 with 0.999999).
    for k = 1, #end_points, 2 do
        local point = end_points[k]

        local previous_point
        -- Get the last end-point first as the first end-point pair. 
        if k == 1 then
            previous_point = end_points[#end_points]
        else
            previous_point = end_points[k - 1]
        end

        table.insert(polygons, {center.x, center.y, point.x, point.y, previous_point.x, previous_point.y})
    end

    return polygons
end

function line_of_sight:draw_visibility_polygons()
    local polygons = self:get_visibility_polygons()

    for k, polygon in pairs(polygons) do
        love.graphics.setColor(self.color)
        love.graphics.polygon("fill", polygon[1], polygon[2], polygon[3], polygon[4], polygon[5], polygon[6])
        love.graphics.setColor(255, 255, 255, 255)
    end

    -- self:draw_debug_ray(polygons)
end

function line_of_sight:draw_debug_ray(polygons)
    -- DEBUG
    local player = self.game.world:find_entities_with_class("player")[1]

    local player_rect = {
        { x = player.x, y = player.y },
        { x = player.x + player.w, y = player.y },
        { x = player.x + player.w, y = player.y + player.h },
        { x = player.x, y = player.y + player.h },
    }

    local player_lines = collision.lines_from_polygon(player_rect)

    local triangles = {}

    for k, polygon in pairs(polygons) do
        local triangle = {
            { x = polygon[1], y = polygon[2] },
            { x = polygon[3], y = polygon[4] },
            { x = polygon[5], y = polygon[6] },
        }

        local triangle_lines = collision.lines_from_visibility_triangle(triangle)

        for k, line in pairs(triangle_lines) do
            for k, p_line in pairs(player_lines) do
                if lines.lines_intersection(line, p_line) then
                    love.graphics.line(line.start.x, line.start.y, line.start.x + line.direction.x, line.start.y + line.direction.y)
                    love.graphics.line(p_line.start.x, p_line.start.y, p_line.start.x + p_line.direction.x, p_line.start.y + p_line.direction.y)

                    print(lines.lines_intersection(line, p_line))
                end
            end
        end
    end
    -- DEBUG END
end

function line_of_sight:cast_ray(start, angle, walls)
    local end_x, end_y = self.game.world.tile_map:get_collision_point(start, angle, walls)

    return { x = end_x, y = end_y }
end

function line_of_sight:draw_arc_mask()
    local center = self.entity:get_center()
    local direction = self.entity.direction

    -- Circle to limit distance.
    love.graphics.arc("fill", center.x, center.y, self.distance, direction + self.fov / 2, direction - self.fov / 2)
end

function line_of_sight:draw()
    -- Limit area rendering to area within fov and distance.
    local function mask_view_area()
        self:draw_arc_mask()
    end

    love.graphics.stencil(mask_view_area, "replace")
    -- love.graphics.setStencilTest("equal", 1)

    self:draw_visibility_polygons()

    love.graphics.setStencilTest()
end