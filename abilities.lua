abilities = {
    za_warudo = {
        sound_effect = love.audio.newSource("assets/za_warudo.mp3", "static"),

        activate = function(world, caster)
            abilities.za_warudo.sound_effect:play()
        end,
    }
}