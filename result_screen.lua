result_screen = {}

function result_screen:create(application)
    local object = { application = application }
    setmetatable(object, {__index = self})
    
    object.zoom = 8

    return object
end

function result_screen:destroy()
    
end

function result_screen:process_event(event)
    if event.type == "key_pressed" or event.type == "mouse_pressed" then
        self.application:change_state(result_screen)
    end
end

function result_screen:update()

end

function result_screen:draw()
    love.graphics.push()
        love.graphics.scale(self.zoom)
        love.graphics.print("You win!", 20, 20)
    love.graphics.pop()
end