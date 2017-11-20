player_control_component = control_component:subclass()

function player_control_component:create(game, entity)
    local object = { game = game, entity = entity }
    setmetatable(object, {__index = self} )

    object.listeners = {
        object.game.observer:add_listener("key_pressed", function(data) object:handle_key_press(data.action) end )
    }

    object.interactable_item = nil
    object.interact_distance = 24

    return object
end

function player_control_component:destory()
    observer.remove_listeners_from_object(self)
end

function player_control_component:handle_key_press(action)
    local ability_component = self.entity.ability_component

    if action == "activate_ability" and ability_component then
        ability_component:activate()
    end
    if action == "interact_with_item" then
        if self.interactable_item then
            self:interact_with_item(self.interactable_item)
        end
    end
end

function player_control_component:interact_with_item(item)
    if item.class == "treasure" then
        print("Chest found!")
    end
end

function player_control_component:get_nearest_interactable_item()
    local nearest_item
    local distance_to_nearest_item
    local center = self.entity:get_center()

    for k, item in pairs(self.game.world:find_entities_with_class("treasure")) do
        if nearest_item then
            local item_center = item:get_center()
            local distance_to_item = vector.dist(center.x, center.y, item_center.x, item_center.y)

            if distance_to_item < distance_to_nearest_item then
                nearest_item = item
                local nearest_item_center = nearest_item:get_center()
                distance_to_nearest_item = vector.dist(center.x, center.y, nearest_item_center.x, nearest_item_center.y)
            end
        else
            nearest_item = item
            local nearest_item_center = nearest_item:get_center()
            distance_to_nearest_item = vector.dist(center.x, center.y, nearest_item_center.x, nearest_item_center.y)
        end
    end

    if distance_to_nearest_item < self.interact_distance then
        return nearest_item
    end
end

function player_control_component:update()
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

    self.game.world:move_entity(entity, goal_x, goal_y)

    self.interactable_item = self:get_nearest_interactable_item()
end