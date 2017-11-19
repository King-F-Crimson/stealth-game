line_of_sight = {}

function line_of_sight:create(game, entity, field_of_view, distance)
    local object = {
        game = game,
        entity = entity,
        fov = field_of_view,
        distance = distance,
    }
    setmetatable(object, {__index = self} )

    return object
end

function line_of_sight:create_triangles()
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

    for k, wall in pairs(walls) do
        love.graphics.line(wall.start.x, wall.start.y, wall.start.x + wall.direction.x, wall.start.y + wall.direction.y)
    end

    for k, point in pairs(end_points) do
        local previous_point
        -- Get the last end-point first as the first end-point pair. 
        if k == 1 then
            previous_point = end_points[#end_points]
        else
            previous_point = end_points[k - 1]
        end

        --love.graphics.line(center.x, center.y, point.x, point.y)
        love.graphics.polygon("fill", center.x, center.y, point.x, point.y, previous_point.x, previous_point.y)
    end
end

function line_of_sight:cast_ray(start, angle, walls)
    local end_x, end_y = self.game.world.tile_map:get_collision_point(start, angle, walls)

    return { x = end_x, y = end_y }
end

function line_of_sight:draw()
    self:create_triangles()
end