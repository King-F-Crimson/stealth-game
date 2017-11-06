entity = {}

function entity:create(game, x, y, w, h)
    local object = { game = game, x = x, y = y, w = w, h = h }
    setmetatable(object, {__index = self} )

    object.control_component = control_component:create(game, object)
    object.graphics_component = graphics_component:create(object)

    object.special_ability_component = special_ability_component:create()

    return object
end

function entity:destroy()
    self.control_component:destroy()
end

function entity:update()
    self.control_component:update()
end

function entity:draw()
    if self.graphics_component then
        self.graphics_component:draw()
    end
end