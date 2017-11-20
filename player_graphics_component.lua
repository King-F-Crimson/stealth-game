player_graphics_component = graphics_component:subclass(love.graphics.newImage("assets/template_unit.png"))

function player_graphics_component:draw()
    graphics_component.draw(self)

    local interactable_item = self.entity.control_component.interactable_item

    if interactable_item then
        local mark_pos = interactable_item:get_center()
        mark_pos.y = mark_pos.y - 20

        love.graphics.print("!", mark_pos.x, mark_pos.y)
    end
end