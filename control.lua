control = {}

function control:create(game)
    local object = { game = game }
    setmetatable(object, {__index = self} )

    object.action_map = {
        move_up =       { "up",     "w" },
        move_down =     { "down",   "s" },
        move_left =     { "left",   "a" },
        move_right =    { "right",  "d" },
    }

    object.key_map = {
        z = "activate_ability",
    }

    return object
end

function control:process_event(event)
    if event.type == "key_pressed" then
        local key = event.data.key
        local action = self.key_map[key]

        if action then
            self.game.observer:notify("key_pressed", { action = action })
        end
    end
end

function control:is_active(action)
    local is_active = false

    for i, key in pairs(self.action_map[action]) do
        if love.keyboard.isScancodeDown(key) then
            is_active = true
        end
    end

    return is_active
end