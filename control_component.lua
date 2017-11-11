control_component = {}

function control_component:create(game, entity)
    local object = { game = game, entity = entity }
    setmetatable(object, {__index = self} )

    return object
end

function control_component:destroy()

end

function control_component:subclass()
    local object = {}
    setmetatable(object, {__index = self} )

    return object
end

function control_component:update()

end