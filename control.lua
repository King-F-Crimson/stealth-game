control = {}

control.key_map = {
    move_up =       { "up",     "w" },
    move_down =     { "down",   "s" },
    move_left =     { "left",   "a" },
    move_right =    { "right",  "d" },
}

function control.is_active(action)
    local is_active = false

    for i, key in pairs(control.key_map[action]) do
        if love.keyboard.isScancodeDown(key) then
            is_active = true
        end
    end

    return is_active
end