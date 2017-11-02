control_component = {}

function control_component:create(entity)
    local object = { entity = entity }
    setmetatable(object, {__index = self} )

    return object
end

function control_component:update()
    local entity = self.entity

    if control.is_active("move_up") then
        entity.y = entity.y - 4
    end
    if control.is_active("move_down") then
        entity.y = entity.y + 4
    end
    if control.is_active("move_left") then
        entity.x = entity.x - 4
    end
    if control.is_active("move_right") then
        entity.x = entity.x + 4
    end
end