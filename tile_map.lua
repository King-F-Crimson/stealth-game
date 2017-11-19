tile_map = {}

function tile_map:create(world)
    local object = { world = world, bump_world = world.bump_world }
    setmetatable(object, {__index = self} )

    object.tiles = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
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

        -- { 1, 1, 1, 1, 1, 1, 1, 1 },
        -- { 1, 0, 0, 0, 0, 0, 0, 1 },
        -- { 1, 0, 0, 0, 0, 0, 0, 1 },
        -- { 1, 0, 0, 0, 1, 0, 0, 1 },
        -- { 1, 0, 0, 1, 0, 0, 0, 1 },
        -- { 1, 0, 0, 0, 1, 0, 0, 1 },
        -- { 1, 0, 0, 0, 0, 0, 0, 1 },
        -- { 1, 1, 1, 1, 1, 1, 1, 1 },
    }

    object.tile_size = 16
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
                            { x = current_wall_start, y = line_number * tile_size },
                            { x = x * tile_size, y = line_number * tile_size },
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
                            { x = line_number * tile_size, y = current_wall_start },
                            { x = line_number * tile_size, y = y * tile_size },
                        })
                    end

                    previous_spot_is_wall = false
                end
            end
        end
    end

    return walls
end

function tile_map:get_collision_point(start, angle)
    local end_x, end_y

    local points = self:get_line_collisions_with_grid(start, angle)

    local function compare(a, b) return a.d < b.d end

    table.sort(points, compare)

    for k, point in pairs(points) do
        print(point.x, point.y, point.d)
        if self:is_coordinates_wall(point.x, point.y) then
            end_x, end_y = point.x, point.y
            break
        end
    end

    print("BUZZ")

    return end_x, end_y
end

function tile_map:get_line_collisions_with_grid(start, angle)
    local tile_size = self.tile_size
    local w = self.w
    local h = self.h

    local points = {}

    local m = math.tan(angle)

    local x_direction
    local y_direction

    if math.abs(angle) < math.pi / 2 then
        x_direction = "forward"
    elseif math.abs(angle) > math.pi / 2 then
        x_direction = "backward"
    else
        -- Static aka m is infinite so moving only up.
        x_direction = "static"
    end

    -- Lua uses left to right and up to down coordinates
    if angle > 0 then
        y_direction = "down"
    elseif angle < 0 then
        y_direction = "up"
    else
        y_direction = "static"
    end

    -- Get all point where x intersects with the vertical grid.
    if x_direction ~= "static" then
        local x = start.x
        local y = start.y

        if x_direction == "forward" then
            x = x - (x % tile_size) + tile_size
        else
            x = x - (x % tile_size)
        end

        y = (x - start.x) * m

        while x < w and x > 0 and y < h and y > 0 do
            local d = math.abs(start.x - x)
            table.insert(points, {x = x, y = y, d = d})

            print("COORD", x, y)

            x = x + tile_size
            y = y + tile_size * m
        end
    end

    -- Same for y.
    if y_direction ~= "static" then
        local x = start.x
        local y = start.y

        if y_direction == "down" then
            y = y - (y % tile_size) + tile_size
        else
            y = y - (y % tile_size)
        end

        x = (y - start.y) / m

        while x < w and x > 0 and y < h and y > 0 do
            local d = math.abs(start.x - x)
            table.insert(points, {x = x, y = y, d = d})

            print("COORD", x, y)

            y = y + tile_size
            x = x + tile_size / m
        end
    end

    return points
end

function tile_map:coordinates_to_tiles(x, y)
    local tile_size = self.tile_size

    local tiles = {}

    -- There would be two x coords or y coords if it is between two tiles 
    -- ex: at x = 48 with tile_size = 16, x_tile will be 3 and x_tile_2 will be 4

    local x_tile, y_tile, x_tile_2, y_tile_2

    x_tile = (x - (x % tile_size)) / tile_size + 1
    y_tile = (y - (y % tile_size)) / tile_size + 1

    if x % tile_size == 0 then
        x_tile_2 = x_tile - 1
    end
    if y % tile_size == 0 then
        y_tile_2 = y_tile - 1
    end

    table.insert(tiles, { x = x_tile, y = y_tile, content = self.tiles[y_tile][x_tile] })

    if x_tile_2 then
        table.insert(tiles, { x = x_tile_2, y = y_tile, content = self.tiles[y_tile][x_tile_2] })
    end
    if y_tile_2 then
        table.insert(tiles, { x = x_tile, y = y_tile_2, content = self.tiles[y_tile_2][x_tile] })
    end
    if x_tile_2 and y_tile_2 then
        table.insert(tiles, { x = x_tile_2, y = y_tile_2, content = self.tiles[y_tile_2][x_tile_2] })
    end

    return tiles
end

function tile_map:is_coordinates_wall(x, y)
    local is_wall = false

    local tiles = self:coordinates_to_tiles(x, y)

    if #tiles ~= 4 then
        for k, tile in pairs(tiles) do
            if tile.content == 1 then
                is_wall = true
            end
        end
    end

    -- Special case if the point is between four tiles, it only counts as wall if there are TWO tiles.
    -- This allows slicing ray.
    if #tiles == 4 then
        local wall_count = 0

        for k, tile in pairs(tiles) do
            if tile.content == 1 then
                wall_count = wall_count + 1
            end
        end

        if wall_count >= 2 then
            is_wall = true
        end
    end

    return is_wall
end