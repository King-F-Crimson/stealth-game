entity = {}

function entity:create(game, base_entity, x, y)
    local object = {
        x = x,
        y = y,
        class = base_entity.class,
        w = base_entity.w,
        h = base_entity.h,
        ox = base_entity.ox,
        oy = base_entity.oy,
        direction = 0,
    }
    
    setmetatable(object, {__index = self} )

    object.control_component  = base_entity.control_component:create(game, object)
    object.graphics_component = base_entity.graphics_component:create(game, object)
    object.ability_component  = base_entity.ability_component:create(game, object)

    return object
end

function entity:destroy()
    self.control_component:destroy()
end

function entity:get_center()
    return { x = self.x + self.w / 2, y = self.y + self.h / 2}
end

function entity:update()
    self.control_component:update()
end

function entity:draw()
    if self.graphics_component then
        self.graphics_component:draw()
    end
end