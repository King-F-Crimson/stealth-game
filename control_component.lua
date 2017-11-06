control_component = {}

function control_component:create(game, entity)
    local object = { game = game, entity = entity }
    setmetatable(object, {__index = self} )

    object.listeners = {
        object.game.observer:add_listener("key_pressed", function(data) object:handle_key_press(data.action) end )
    }

    return object
end

function control_component:destory()
    observer.remove_listeners_from_object(self)
end

function control_component:handle_key_press(action)
    local special_ability_component = self.entity.special_ability_component

    if action == "activate_special" and special_ability_component then
        special_ability_component:activate()
    end
end

function control_component:update()
    local entity = self.entity
    local control = self.game.control

    local goal_x = entity.x
    local goal_y = entity.y

    if control:is_active("move_up") then
        goal_y = goal_y - 4
    end
    if control:is_active("move_down") then
        goal_y = goal_y + 4
    end
    if control:is_active("move_left") then
        goal_x = goal_x - 4
    end
    if control:is_active("move_right") then
        goal_x = goal_x + 4
    end

    self.game.world:move_entity(self.entity, goal_x, goal_y)
end