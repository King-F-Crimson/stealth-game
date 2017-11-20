game = {}

function game:create(application, args)
    local object = { application = application, observer = application.observer }
    setmetatable(object, {__index = self})

    object.tile_size = 16

    object.control = control:create(object)
    object.world = world:create(object)
    object.camera = camera:create()

    local player = object.world:find_entities_with_class("player")[1]

    object.camera:set_centered_entity(player)

    object.listeners = {

    }

    return object
end

function game:destroy()
    self.world:destroy()

    observer.remove_listeners_from_object(self)
end

function game:update()
    self.world:update()
    self.camera:update()
end

function game:draw()
    love.graphics.push()
        self.camera:apply_transformation()
        self.camera:apply_shader()
        self.world:draw()
        love.graphics.setShader()
    love.graphics.pop()
end

function game:process_event(event)
    self.control:process_event(event)
end

