entity = {}

function entity:create(game, base_entity, x, y)
    local object = {
        x = x,
        y = y,
        w = base_entity.w,
        h = base_entity.h,
        ox = base_entity.ox,
        oy = base_entity.oy,
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

function entity:update()
    self.control_component:update()
end

function entity:draw()
    if self.graphics_component then
        self.graphics_component:draw()
    end
end