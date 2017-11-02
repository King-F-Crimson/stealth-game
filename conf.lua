function love.conf(t)
    t.console = true
    t.identity = "game_title"

    t.window.title = "Game Title"
    t.window.highdpi = true
    -- t.window.icon = "assets/window_icon.png"

    io.stdout:setvbuf("no")
end