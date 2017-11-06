camera = {}

function camera:create()
    local object = {}
    setmetatable(object, {__index = self} )

    object.zoom = 4

    return object
end

function camera:update()
    if self.active_shader then
        self.shader_time = self.shader_time + 1

        if self.shader_time == self.shader_duration then
            self.active_shader = nil
        end
    end
end

function camera:add_shader(shader, duration)
    self.shader_duration = duration
    self.shader_time = 0

    self.active_shader = shader
end

function camera:apply_shader()
    love.graphics.setShader(self.active_shader)
end

function camera:apply_transformation()
    local entity = self.centered_entity
    local screen = {
        w = love.graphics.getWidth() / self.zoom,
        h = love.graphics.getHeight() / self.zoom,
    }

    local translate = {
        x = (screen.w - entity.w) / 2 - entity.x,
        y = (screen.h - entity.h) / 2 - entity.y,
    }

    love.graphics.scale(self.zoom)
    love.graphics.translate(translate.x, translate.y)
end

function camera:set_centered_entity(entity)
    self.centered_entity = entity
end