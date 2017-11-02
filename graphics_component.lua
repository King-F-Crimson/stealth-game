graphics_component = {}

function graphics_component:create(entity)
    local object = { entity = entity }
    setmetatable(object, {__index = self} )

    object.sprite = love.graphics.newImage("assets/template_unit.png")

    return object
end

function graphics_component:draw()
    local entity = self.entity

    love.graphics.draw(self.sprite, entity.x, entity.y)
end