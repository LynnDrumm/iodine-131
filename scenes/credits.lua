local font = love.graphics.newFont("font/BebasNeue.otf", 48)
local flash = 1

function credits()

        love.graphics.push()

        love.graphics.translate(canvasW / 2, canvasH / 2)

        local text = "Alpha C      Lynn"

        love.graphics.setFont(font)

        local w = font:getWidth(text)
        local h = font:getHeight(text)
        local x = 0 - (w / 2)
        local y = 0 - (h / 2)

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print(text, x, y)

        local text = "                   +"
        love.graphics.setColor(.7, .4, .4, 1)
        love.graphics.print(text, x, y)

        love.graphics.pop()

        if (flash > 0) then

                love.graphics.setColor(1, 1, 1, flash)
                love.graphics.rectangle("fill", 0, 0, canvasW, canvasH)

                flash = flash - .3 * dt
        end

end