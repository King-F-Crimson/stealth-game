guard_graphics_component = graphics_component:subclass(love.graphics.newImage("assets/template_unit.png"))

function guard_graphics_component:draw()
    local entity = self.entity

    entity.control_component.line_of_sight:draw()
    love.graphics.draw(self.sprite, entity.x, entity.y, 0, 1, 1, entity.ox, entity.oy)
end