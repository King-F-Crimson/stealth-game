entities = {
    player = {
        class = "player",

        w = 8,
        h = 13,

        ox = 4,
        oy = 2,
        
        graphics_component = player_graphics_component,
        control_component  = player_control_component,
        ability_component  = ability_component:subclass(),
    },

    guard = {
        class = "guard",

        w = 8,
        h = 13,

        ox = 4,
        oy = 2,
        
        graphics_component = guard_graphics_component,
        control_component  = ai_guard_control_component,
        ability_component  = ability_component:subclass(),
    },

    treasure = {
        class = "treasure",

        w = 14,
        h = 12,

        ox = 1,
        oy = 3,

        graphics_component = graphics_component:subclass(love.graphics.newImage("assets/chest.png")),
        control_component  = control_component:subclass(),
        ability_component  = ability_component:subclass(),
    },

    door = {
        class = "door",

        w = 10,
        h = 14,

        ox = 3,
        oy = 2,

        graphics_component = graphics_component:subclass(love.graphics.newImage("assets/door.png")),
        control_component  = control_component:subclass(),
        ability_component  = ability_component:subclass(),
    }
}