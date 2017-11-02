require("game")
require("title_screen")
require("observer")
require("queue")

application = {
    font = love.graphics.newImageFont("assets/font.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")
}
application.font:setFilter("nearest")
love.graphics.setFont(application.font)

function application:create()
    local object = {}
    setmetatable(object, { __index = self })

    love.window.setFullscreen(true, "desktop")
    love.keyboard.setKeyRepeat(true)
    love.graphics.setBackgroundColor(0, 0, 0)

    math.randomseed(os.time())

    object.zoom = 1

    object.observer = observer:create()
    object.state = title_screen:create(object, object.observer)

    object.event_queue = queue:create()

    return object
end

function application:get_scaled_window_width()
    return love.graphics.getWidth() / self.zoom
end

function application:get_scaled_window_height()
    return love.graphics.getHeight() / self.zoom
end

function application:update()
    while not self.event_queue:empty() do
        self.state:process_event(self.event_queue:pop())
    end
    self.state:update()
end

function application:draw()
    love.graphics.push()
        love.graphics.scale(self.zoom)
        self.state:draw()
    love.graphics.pop()
end

function application:change_state(new_state, state_args)
    self.state:destroy()

    self.state = new_state:create(self, self.observer, state_args)
end

function application:receive_event(event)
    self.event_queue:push(event)
end

function application:key_pressed(key)
    if key == "escape" then
        love.event.push("quit")
    end

    local event = { type = "key_pressed", data = { key = key } }
    self:receive_event(event)
end

function application:key_released(key)
    local event = { type = "key_released", data = { key = key } }
    self:receive_event(event)
end

function application:mouse_pressed(x, y, button, is_touch)
    local event = { type = "mouse_pressed", data = { x = x, y = y, button = button, is_touch = is_touch} }
    self:receive_event(event)
end

function application:mouse_wheel_moved(x, y)
    local event = { type = "mouse_wheel_moved", data = { x = x, y = y } }
    self:receive_event(event)
end