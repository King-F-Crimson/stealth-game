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

function line_of_sight:get_entities_in_sight()
    local entities_in_sight = {}

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
        -- Cast another angles with a slight derivation to hit the wall behind corners.
        table.insert(end_points, self:cast_ray(center, angle - 0.000001, walls))
        table.insert(end_points, self:cast_ray(center, angle, walls))
        table.insert(end_points, self:cast_ray(center, angle + 0.000001, walls))
    end

    local polygons = {}

    for k, point in pairs(end_points) do
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
end

function line_of_sight:cast_ray(start, angle, walls)
    local end_x, end_y = self.game.world.tile_map:get_collision_point(start, angle, walls)

    return { x = end_x, y = end_y }
end

function line_of_sight:draw_mask()
    local center = self.entity:get_center()
    local direction = self.entity.direction

    -- Circle to limit distance.
    love.graphics.arc("fill", center.x, center.y, self.distance, direction + self.fov / 2, direction - self.fov / 2)
end

function line_of_sight:draw()
    -- Limit area rendering to area within fov and distance.
    local function mask_view_area()
        self:draw_mask()
    end

    love.graphics.stencil(mask_view_area, "replace")
    love.graphics.setStencilTest("equal", 1)

    self:draw_visibility_polygons()

    love.graphics.setStencilTest()
end