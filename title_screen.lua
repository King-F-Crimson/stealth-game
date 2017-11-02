title_screen = {}

function title_screen:create(application)
    local object = { application = application }
    setmetatable(object, {__index = self})

    object.background = love.graphics.newImage("assets/title_screen.png")
    object.background:setFilter("nearest")
    
    object.zoom = 8

    return object
end

function title_screen:destroy()
    
end

function title_screen:process_event(event)
    if event.type == "key_pressed" or event.type == "mouse_pressed" then
        self.application:change_state(game)
    end
end

function title_screen:update()

end

function title_screen:draw()
    love.graphics.push()
        love.graphics.scale(self.zoom)
        love.graphics.draw(self.background)
    love.graphics.pop()
end