graphics_component = {}

function graphics_component:create(game, entity, sprite)
    local object = { game = game, entity = entity, sprite = sprite }
    setmetatable(object, {__index = self} )

    return object
end

function graphics_component:subclass(sprite)
    local object = { sprite = sprite }
    setmetatable(object, {__index = self} )

    return object
end

function graphics_component:draw()
    local entity = self.entity

    love.graphics.draw(self.sprite, entity.x, entity.y, 0, 1, 1, entity.ox, entity.oy)
end