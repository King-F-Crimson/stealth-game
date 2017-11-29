ai_guard_control_component = control_component:subclass()

local agcc = ai_guard_control_component

function agcc:create(game, entity)
    local object = { game = game, entity = entity }
    setmetatable(object, {__index = self} )

    object.state = "patrol_right"
    object.walk_timer = 120

    object.line_of_sight = line_of_sight:create(game, entity, math.pi * 0.5, game.tile_size * 10)

    return object
end

function agcc:is_player_detected()
    for k, entity in pairs(self.line_of_sight:get_entities_in_sight()) do
        print(entity.class)
    end
end

function agcc:update()
    if not self.game.world.time_is_stopped then
        local entity = self.entity

        local goal_x, goal_y
        local direction

        if self.state == "patrol_right" then
            goal_x, goal_y = entity.x + 1, entity.y + 1
            direction = 0

            if self.walk_timer == 0 then
                self.state = "patrol_left"
                self.walk_timer = 120
            end

        elseif self.state == "patrol_left" then
            goal_x, goal_y = entity.x - 1, entity.y - 1
            direction = math.pi

            if self.walk_timer == 0 then
                self.state = "patrol_right"
                self.walk_timer = 120
            end

        else
            goal_x, goal_y = entity.x, entity.y
        end

        self.walk_timer = self.walk_timer - 1

        self.game.world:move_entity(entity, goal_x, goal_y)
        entity.direction = direction

        self:is_player_detected()
    end
end