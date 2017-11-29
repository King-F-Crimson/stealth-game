guard_graphics_component = graphics_component:subclass(love.graphics.newImage("assets/template_unit.png"))

function guard_graphics_component:draw()
    local entity = self.entity
    
    love.graphics.draw(self.sprite, entity.x, entity.y, 0, 1, 1, entity.ox, entity.oy)

    if entity.control_component.player_in_sight then
        love.graphics.print("!", entity.x, entity.y - 16)
    end
end