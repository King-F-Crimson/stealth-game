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
    local center = self.entity:get_center()
    -- Get only horizontal walls since they share edges with vertical walls.
    local walls = self.game.world.tile_map:get_walls(true, false)
    local angles = self:get_casting_angles(walls)

    -- Cast a ray to every point where a wall starts or ends.
    for k, angle in pairs(angles) do
        self:cast_ray(center, angle)
    end
end

function line_of_sight:get_casting_angles(walls)
    local angles = {}

    local center = self.entity:get_center()

    for k, wall in pairs(walls) do
        table.insert(angles, (vector.toPolar(wall[1].x - center.x, wall[1].y - center.y)))
        table.insert(angles, (vector.toPolar(wall[2].x - center.x, wall[2].y - center.y)))
    end

    return angles
end

function line_of_sight:cast_ray(start, angle)
    local end_x, end_y = self.game.world.tile_map:get_collision_point(start, angle)

    love.graphics.line(start.x, start.y, end_x, end_y)
end

function line_of_sight:draw()
    self:create_triangles()
end