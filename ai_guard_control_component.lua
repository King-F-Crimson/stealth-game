ai_guard_control_component = control_component:subclass()

local agcc = ai_guard_control_component

function agcc:create(game, entity)
    local object = { game = game, entity = entity }
    setmetatable(object, {__index = self} )

    object.state = "patrol_right"
    object.walk_timer = 120

    return object
end

function agcc:update()
    local entity = self.entity

    local goal_x, goal_y

    if self.state == "patrol_right" then
        goal_x, goal_y = entity.x + 1, entity.y + 1

        if self.walk_timer == 0 then
            self.state = "patrol_left"
            self.walk_timer = 120
        end

    elseif self.state == "patrol_left" then
        goal_x, goal_y = entity.x - 1, entity.y - 1

        if self.walk_timer == 0 then
            self.state = "patrol_right"
            self.walk_timer = 120
        end

    else
        goal_x, goal_y = entity.x, entity.y
    end

    self.walk_timer = self.walk_timer - 1

    self.game.world:move_entity(entity, goal_x, goal_y)
end