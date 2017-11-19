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

    -- Cast a ray to every point where a wall starts or ends.
    for k, angle in pairs(angles) do
        self:cast_ray(center, angle, walls)
    end

    for k, wall in pairs(walls) do
        love.graphics.line(wall.start.x, wall.start.y, wall.start.x + wall.direction.x, wall.start.y + wall.direction.y)
    end
end

function line_of_sight:cast_ray(start, angle, walls)
    local end_x, end_y = self.game.world.tile_map:get_collision_point(start, angle, walls)

    love.graphics.line(start.x, start.y, end_x, end_y)
end

function line_of_sight:draw()
    self:create_triangles()
end