world = {}

function world:create()
    local object = {}
    setmetatable(object, {__index = self} )

    object.map = map:create()
    object.entities = { entity:create(32, 32, 16, 16) }
    object.canvas = love.graphics.newCanvas()

    return object
end

function world:update()
    self.map:update()

    for i, entity in pairs(self.entities) do
        entity:update()
    end

    self:update_canvas()
end

function world:update_canvas()
    love.graphics.setCanvas(self.canvas)
        love.graphics.clear()

        self.map:draw()
        for i, entity in pairs(self.entities) do
            entity:draw()
        end

    love.graphics.setCanvas()
end

function world:draw()
    love.graphics.draw(self.canvas)
end