game = {}

function game:create(application, args)
    local object = { application = application, observer = application.observer }
    setmetatable(object, {__index = self})

    object.world = world:create()
    object.zoom = 4

    object.listeners = {

    }

    return object
end

function game:destroy()
    observer.remove_listeners_from_object(self)
end

function game:update()
    self.world:update()
end

function game:draw()
    love.graphics.push()
        love.graphics.scale(self.zoom)
        self.world:draw()
    love.graphics.pop()
end

function game:process_event(event)

end

