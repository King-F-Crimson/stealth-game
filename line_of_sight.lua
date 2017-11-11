line_of_sight = {}

function line_of_sight:create(game, entity, field_of_view, distance)
    local object = { game = game, entity = entity, fov = field_of_view, distance = distance }
    setmetatable(object, {__index = self} )

    return object
end

function line_of_sight:create_triangles()
    
end

function line_of_sight:get_walls()
    local walls = {}

    local tile_map = self.game.world.tile_map.tiles
    local tile_size = self.game.world.tile_map.tile_size

    local function get_wall_from_tile(x, y, tile_size)
        local walls = {
            {x * tile_size, y * tile_size},
            {x * tile_size, (y + 1) * tile_size},
            {(x + 1) * tile_size, y * tile_size},
            {(x + 1) * tile_size, (y + 1) * tile_size},
        }

        return walls
    end

    for y, row in pairs(tile_map) do
        for x, tile in pairs(row) do
            if tile == 1 then
                for wall in get_wall_from_tile(x - 1, y - 1, tile_size) do
                    table.insert(walls, wall)
                end
            end
        end
    end
end

function line_of_sight:draw()

end