ability_component = {}

function ability_component:create(game, entity)
    local object = { game = game, entity = entity }
    setmetatable(object, {__index = self} )

    return object
end

function ability_component:subclass()
    local object = {}
    setmetatable(object, {__index = self} )

    return object
end

function ability_component:activate()
    abilities.za_warudo:activate(self.game, self.entity)
end