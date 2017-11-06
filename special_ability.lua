special_ability = {}

function special_ability:create()
    local object = { }
    setmetatable(object, {__index = self} )

    return object
end

function special_ability:activate(world, caster)
    
end