world = {}

function world:create(game)
    local object = { game = game }
    setmetatable(object, {__index = self} )

    object.bump_world = bump.newWorld(32)

    object.tile_map = tile_map:create(object)
    object.entities = {}
    object.canvas = love.graphics.newCanvas(256, 256)

    object:add_entity(entity:create(object.game, 32, 32, 16, 16))

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