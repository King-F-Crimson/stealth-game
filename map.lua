map = {}

function map:create()
    local object = {}
    setmetatable(object, {__index = self} )

    object.tiles = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    }

    object.tile_size = 16
    object.w = #object.tiles[1] * object.tile_size
    object.h = #object.tiles * object.tile_size

    love.graphics.setDefaultFilter("nearest")

    object.tile_sprites = {
        love.graphics.newImage("assets/tile_0.png"),
        love.graphics.newImage("assets/tile_1.png"),
    }

    object.canvas = love.graphics.newCanvas(object.w, object.h)

    return object
end

function map:update()
    self:update_canvas()
end

function map:update_canvas()
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

function map:get_origin()
    return {self.w / 2, self.h / 2}
end

function map:draw()
    love.graphics.push()
        love.graphics.draw(self.canvas)
    love.graphics.pop()
end