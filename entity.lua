entity = {}

function entity:create(world, x, y, w, h)
    local object = { world = world, x = x, y = y, w = w, h = h }
    setmetatable(object, {__index = self} )

    object.control_component = control_component:create(world, object)
    object.graphics_component = graphics_component:create(object)

    return object
end

function entity:update()
    self.control_component:update()
end

function entity:draw()
    if self.graphics_component then
        self.graphics_component:draw()
    end
end