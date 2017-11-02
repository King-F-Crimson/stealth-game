require("map")

world = {}

function world:create()
    local object = {}
    setmetatable(object, {__index = self} )

    object.map = map:create()

    return object
end

function world:update()

end

function world:draw()
    self.map:draw()
end