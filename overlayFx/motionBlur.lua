local blurBuffer1 = love.graphics.newCanvas(canvas:getWidth(), canvas:getHeight())
local blurBuffer2 = love.graphics.newCanvas(canvas:getWidth(), canvas:getHeight())

-- intensity  value is inverted (1 == low, .1 == high)
-- intensity2 value is not inverted (1 == high, .1 == low)
function motionBlur(intensity, intensity2)

        activeCanvas = love.graphics.getCanvas()

        love.graphics.setCanvas(blurBuffer1)
        love.graphics.draw(activeCanvas)

        love.graphics.setCanvas(blurBuffer2)
        love.graphics.setColor(1, 1, 1, intensity)
        love.graphics.draw(blurBuffer1)

        love.graphics.setCanvas(activeCanvas)
        love.graphics.setColor(1, 1, 1, intensity2)
        love.graphics.draw(blurBuffer2)
end