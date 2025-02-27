local hue               = 0
local blurIntensity     = .1

function carpet()

        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle("fill", 0, 0, canvasW, canvasH)

        love.graphics.push()
        love.graphics.translate(canvas:getWidth() / 2, canvas:getHeight() / 2)

        local size    = (math.sin(c * .3) * 64) + 192

        love.graphics.rotate(c * .9)

        xor     = 0
        y       = -canvas:getHeight()

        local alphaSin = math.sin(c * 8) * .05 + .2

        for y = y, canvas:getHeight(), size do

                if bit.bxor(0, xor) == 0 then

                        x       = -canvas:getWidth()
                        xor     = 1
                else

                        x       = -canvas:getWidth() + size
                        xor     = 0
                end

                for x = x,canvas:getWidth(), size * 2 do

                        love.graphics.setColor(1, 1, 1, alphaSin)
                        love.graphics.rectangle("fill", x, y, size, size)
                        love.graphics.setColor(1, 1, 1, alphaSin)
                        love.graphics.rectangle("fill", x + size /  2, y + size /  2, size, size)
                        love.graphics.setColor(1, 1, 1, alphaSin)
                        love.graphics.rectangle("fill", x - size /  .5, y - size /  .5, size, size)
                        love.graphics.setColor(1, 1, 1, alphaSin)
                        love.graphics.rectangle("fill", x - size /  4, y - size /  2, size, size)
                        love.graphics.setColor(1, 1, 1, alphaSin)
                        love.graphics.rectangle("fill", x - size / 2, y - size / 4, size, size)
                end
        end

        love.graphics.pop()

        motionBlur(.1, .9)

end