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
    local walls = self:get_walls()
    local angles = self:get_casting_angles()

    -- Cast a ray to every point where a wall starts or ends.
    for k, angle in pairs(angles) do
        self:cast_ray(center, angle)
    end
end

function line_of_sight:get_walls()
    local walls = {}

    local tile_map = self.game.world.tile_map.tiles
    local tile_size = self.game.world.tile_map.tile_size
    local row_count = #self.game.world.tile_map.tiles
    local col_count = #self.game.world.tile_map.tiles[1]

    -- Get horizontal walls.

    -- Iterate each line on top the first row, between all rows, and under the last row.
    -- Ex:
    -- 0 ____________
    --   ############
    -- 1 ____________
    --   ############
    -- 2 ____________
    -- 
    -- Where '_' is the wall and '#' is the tile.

    -- A wall must follow the following conditions:
    -- - Have either a tile on top of it or below it, but not both.

    -- Walls will be combined with its neighbors.

    for line_number = 0, row_count, 1 do
        local previous_spot_is_wall = false
        local current_wall_start
        
        for x = 0, col_count - 1, 1 do 
            local tile_on_top = false

            -- Check tile above if it's not the first line
            if line_number ~= 0 then
                if tile_map[line_number][x + 1] == 1 then
                    tile_on_top = true
                end
            else
                tile_on_top = true
            end

            local tile_below = false

            -- Check tile below if it's not the last line
            if line_number ~= row_count then
                if tile_map[line_number + 1][x + 1] == 1 then
                    tile_below = true
                end
            else
                tile_below = true
            end

            local is_wall = tile_on_top ~= tile_below

            if is_wall then
                if previous_spot_is_wall then

                else
                    -- Start a new wall.
                    current_wall_start = x * 16
                end

                previous_spot_is_wall = true
            else
                if previous_spot_is_wall then
                    love.graphics.line(current_wall_start, line_number * 16, x * 16, line_number * 16)
                end

                previous_spot_is_wall = false
            end
        end
    end

    return walls
end

function line_of_sight:get_casting_angles()
    local angles = {}

    local center = self.entity:get_center()

    for k, wall in pairs(self:get_walls()) do
        table.insert(angles, (vector.toPolar(wall[1].x - center.x, wall[1].y - center.y)))
        table.insert(angles, (vector.toPolar(wall[2].x - center.x, wall[2].y - center.y)))
    end

    return angles
end

function line_of_sight:cast_ray(start, angle)
    local ray_m, ray_c = line.from_coordinate_and_angle(angle, start.x, start.y)

    local end_x, end_y = vector.fromPolar(angle, 50)
    end_x, end_y = end_x + start.x, end_y + start.y

    love.graphics.line(start.x, start.y, end_x, end_y)
end

function line_of_sight:get_collision_point(start, angle)

end

function line_of_sight:draw()
    self:create_triangles()
end