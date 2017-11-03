game = {}

function game:create(application, args)
    local object = { application = application, observer = application.observer }
    setmetatable(object, {__index = self})

    object.world = world:create()
    object.camera = camera:create()

    object.camera:set_centered_entity(object.world.entities[1])

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
        self.camera:apply_transformation()
        self.world:draw()
    love.graphics.pop()
end

function game:process_event(event)

end

