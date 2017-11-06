control_component = {}

function control_component:create(world, entity)
    local object = { world = world, entity = entity }
    setmetatable(object, {__index = self} )

    return object
end

function control_component:update()
    local entity = self.entity

    local goal_x = entity.x
    local goal_y = entity.y

    if control.is_active("move_up") then
        goal_y = goal_y - 4
    end
    if control.is_active("move_down") then
        goal_y = goal_y + 4
    end
    if control.is_active("move_left") then
        goal_x = goal_x - 4
    end
    if control.is_active("move_right") then
        goal_x = goal_x + 4
    end

    self.world:move_entity(self.entity, goal_x, goal_y)
end