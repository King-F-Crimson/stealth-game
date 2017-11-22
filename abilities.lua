abilities = {
    za_warudo = {
        sound_effect = love.audio.newSource("assets/za_warudo.mp3", "static"),
        shader = love.graphics.newShader("shaders/za_warudo.fs"),
        shader_duration = 150,

        activate = function(self, game, caster)
            local function send_shader_data(shader)
                local center = caster:get_center()

                shader:send("center", {center.x / game.world.tile_map.w, center.y / game.world.tile_map.h})
            end

            game.camera:add_shader(self.shader, self.shader_duration, send_shader_data)

            self.sound_effect:play()
        end,
    }
}