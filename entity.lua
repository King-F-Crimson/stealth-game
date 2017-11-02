entity = {}

function entity:create(x, y)
    local object = { x = x, y = y }
    setmetatable(object, {__index = self} )

    object.graphics_component = graphics_component:create(object)

    return object
end

function entity:update()

end

function entity:draw()
    if self.graphics_component then
        self.graphics_component:draw()
    end
end