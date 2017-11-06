abilities = {
    za_warudo = {
        sound_effect = love.audio.newSource("assets/za_warudo.mp3", "static"),
        shader = love.graphics.newShader("shaders/za_warudo.fs"),
        shader_duration = 150,

        activate = function(self, game, caster)
            game.camera:add_shader(self.shader, self.shader_duration)

            self.sound_effect:play()
        end,
    }
}