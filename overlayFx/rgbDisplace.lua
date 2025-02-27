local screenCopy = love.graphics.newCanvas(canvasW, canvasH)

function rgbDisplace(offset, intensity, mask)

        activeCanvas = love.graphics.getCanvas()

        --screenCopy:setWrap("repeat", "repeat")

        love.graphics.setCanvas(screenCopy)
        love.graphics.clear()
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(canvas, 0, 0)

        love.graphics.setCanvas(activeCanvas)

        -- red
        love.graphics.setColor(1, 0, 1, intensity)
        love.graphics.draw(screenCopy, -offset, -offset)
        -- blue
        love.graphics.setColor(0, 1, 1, intensity / 2)
        love.graphics.draw(screenCopy, 0 + offset, 0 + offset)
        -- white
        love.graphics.setColor(1, 1, 1, mask)
        love.graphics.draw(screenCopy)
end