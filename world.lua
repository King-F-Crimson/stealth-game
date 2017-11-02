world = {}

function world:create()
    local object = {}
    setmetatable(object, {__index = self} )

    object.map = map:create()
    object.entities = { entity:create(0, 0) }

    return object
end

function world:update()
    for i, entity in pairs(self.entities) do
        entity:update()
    end
end

function world:draw()
    self.map:draw()

    for i, entity in pairs(self.entities) do
        entity:draw()
    end
end