entities = {
    player = {
        w = 8,
        h = 13,

        ox = 4,
        oy = 2,
        
        graphics_component = graphics_component:create(nil, nil, love.graphics.newImage("assets/template_unit.png")),
        control_component  = control_component:create(),
        ability_component  = ability_component:create(),
    }
}