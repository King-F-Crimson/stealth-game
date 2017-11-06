special_ability_component = {}

function special_ability_component:create(game, entity)
    local object = { game = game, entity = entity }
    setmetatable(object, {__index = self} )

    return object
end

function special_ability_component:activate()
    print("ZA WARUDO")
end