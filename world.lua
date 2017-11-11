world = {}

function world:create(game)
    local object = { game = game }
    setmetatable(object, {__index = self} )

    object.bump_world = bump.newWorld(32)

    object.tile_map = tile_map:create(object)
    object.entities = {}
    object.canvas = love.graphics.newCanvas(object.tile_map.w, object.tile_map.h)

    object:add_entity(entity:create(object.game, entities.player, 32, 32))
    object:add_entity(entity:create(object.game, entities.guard, 64, 64))

    return object
end

function world:destroy()
    for k, entity in pairs(self.entities) do
        entity:destroy()
    end
end

function world:update()
    self.tile_map:update()

    for i, entity in pairs(self.entities) do
        entity:update()
    end

    self:update_canvas()
end

function world:find_entity_with_class(class)
    local entities_with_class = {}

    for k, entity in pairs(self.entities) do
        if entity.class == class then
            table.insert(entities_with_class, entity)
        end
    end

    return entities_with_class
end

function world:update_canvas()
    love.graphics.setCanvas(self.canvas)
        love.graphics.clear()

        self.tile_map:draw()
        for i, entity in pairs(self.entities) do
            entity:draw()
        end

    love.graphics.setCanvas()
end

function world:draw()
    love.graphics.draw(self.canvas)
end

function world:add_entity(entity)
    table.insert(self.entities, entity)

    self.bump_world:add(entity, entity.x, entity.y, entity.w, entity.h)
end

function world:move_entity(entity, goal_x, goal_y)
    entity.x, entity.y = self.bump_world:move(entity, goal_x, goal_y)
end