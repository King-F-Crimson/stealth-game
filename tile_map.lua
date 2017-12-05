tile_map = {}

function tile_map:create(world)
    local object = { world = world, bump_world = world.bump_world }
    setmetatable(object, {__index = self} )

    object.tiles = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    }

    object.tile_size = world.game.tile_size
    object.col_count = #object.tiles[1]
    object.row_count = #object.tiles
    object.w = object.col_count * object.tile_size
    object.h = object.row_count * object.tile_size

    love.graphics.setDefaultFilter("nearest")

    object.tile_sprites = {
        love.graphics.newImage("assets/tile_0.png"),
        love.graphics.newImage("assets/tile_1.png"),
    }

    object.canvas = love.graphics.newCanvas(object.w, object.h)

    object:initialize_bump_world()

    return object
end

function tile_map:update()
    self:update_canvas()
end

function tile_map:update_canvas()
    love.graphics.setCanvas(self.canvas)
        love.graphics.push()
            for y, row in pairs(self.tiles) do
                y = y - 1
                for x, tile in pairs(row) do
                    x = x - 1
                    love.graphics.draw(self.tile_sprites[tile + 1], self.tile_size * x, self.tile_size * y)
                end
            end
        love.graphics.pop()
    love.graphics.setCanvas()
end

function tile_map:initialize_bump_world()
    for y, row in pairs(self.tiles) do
        y = y - 1
        for x, tile in pairs(row) do
            x = x - 1

            if tile == 1 then
                self.bump_world:add({}, self.tile_size * x, self.tile_size * y, self.tile_size, self.tile_size)
            end
        end
    end
end

function tile_map:get_origin()
    return {self.w / 2, self.h / 2}
end

function tile_map:draw()
    love.graphics.push()
        love.graphics.draw(self.canvas)
    love.graphics.pop()
end

function tile_map:get_walls(horizontal, vertical)
    -- Arguments are booleans for getting each type of wall.
    local horizontal = horizontal or true
    local vertical = vertical or true

    local walls = {}

    local tile_map = self.tiles
    local tile_size = self.tile_size
    local col_count, row_count = self.col_count, self.row_count

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
    if horizontal then
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
                    if not previous_spot_is_wall then
                        -- Start a new wall.
                        current_wall_start = x * tile_size
                    end

                    previous_spot_is_wall = true
                else
                    if previous_spot_is_wall then
                        table.insert(walls, {
                            start = { x = current_wall_start, y = line_number * tile_size },
                            stop  = { x = x * tile_size, y = line_number * tile_size },
                            direction = { x = x * tile_size - current_wall_start, y = 0 }, -- stop - start
                        })
                    end

                    previous_spot_is_wall = false
                end
            end
        end
    end

    if vertical then
        for line_number = 0, col_count, 1 do
            local previous_spot_is_wall = false
            local current_wall_start
            
            for y = 0, col_count - 1, 1 do 
                local tile_on_left = false

                -- Check tile above if it's not the first line
                if line_number ~= 0 then
                    if tile_map[y + 1][line_number] == 1 then
                        tile_on_left = true
                    end
                else
                    tile_on_left = true
                end

                local tile_on_right = false

                -- Check tile below if it's not the last line
                if line_number ~= col_count then
                    if tile_map[y + 1][line_number + 1] == 1 then
                        tile_on_right = true
                    end
                else
                    tile_on_right = true
                end

                local is_wall = tile_on_left ~= tile_on_right

                if is_wall then
                    if not previous_spot_is_wall then
                        -- Start a new wall.
                        current_wall_start = y * tile_size
                    end

                    previous_spot_is_wall = true
                else
                    if previous_spot_is_wall then
                        table.insert(walls, {
                            start = { x = line_number * tile_size, y = current_wall_start },
                            stop  = { x = line_number * tile_size, y = y * tile_size },
                            direction = { x = 0, y = y * tile_size - current_wall_start },
                        })
                    end

                    previous_spot_is_wall = false
                end
            end
        end
    end

    return walls
end

-- Walls are provided as argument to not recalculate walls.
function tile_map:get_collision_point(start, angle, walls)
    local d_x, d_y = vector.fromPolar(angle, 1)
    local ray = { 
        start = { x = start.x, y = start.y },
        direction = { x = d_x, y = d_y },
    }

    local closest_wall

    for k, wall in pairs(walls) do
        local i_x, i_y, distance = lines.ray_line_intersection(ray, wall)

        -- If there's an intersection, compare it with the closest wall.
        -- And if it's shorter than the current closest wall, replace it.
        if distance then
            if closest_wall then
                if distance < closest_wall.distance then 
                    closest_wall = { x = i_x, y = i_y, distance = distance }
                end
            else
                closest_wall = { x = i_x, y = i_y, distance = distance }
            end
        end
    end

    return closest_wall.x, closest_wall.y
end


function tile_map:get_wall_ending_angles(center)
    local angles = {}
    
    -- Get only horizontal walls since they share edges with vertical walls.

    local walls = self:get_walls(true, false)

    for k, wall in pairs(walls) do
        table.insert(angles, (vector.toPolar(wall.start.x - center.x, wall.start.y - center.y)))
        table.insert(angles, (vector.toPolar(wall.stop.x - center.x, wall.stop.y - center.y)))
    end

    return angles
end