entities = {
    player = {
        class = "player",

        w = 8,
        h = 13,

        ox = 4,
        oy = 2,
        
        graphics_component = graphics_component:subclass(love.graphics.newImage("assets/template_unit.png")),
        control_component  = player_control_component,
        ability_component  = ability_component:subclass(),
    },

    guard = {
        class = "guard",

        w = 8,
        h = 13,

        ox = 4,
        oy = 2,
        
        graphics_component = graphics_component:subclass(love.graphics.newImage("assets/template_unit.png")),
        control_component  = ai_guard_control_component,
        ability_component  = ability_component:subclass(),
    },
}