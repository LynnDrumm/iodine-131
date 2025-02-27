logoGfx = love.graphics.newImage("gfx/tvLogo.png")

function tvLogo()

        logoW = logoGfx:getWidth()
        logoH = logoGfx:getHeight()

        x = (canvasW - logoW) - 16
        y = 16

        love.graphics.setColor(1, 1, 1, .5)
        love.graphics.draw(logoGfx, x + logoW / 1.45, y, 0, .3, .3)
end