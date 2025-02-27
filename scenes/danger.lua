local dangerGfx = { }

for i = 1, 8 do
        dangerGfx[i] = love.graphics.newImage("/gfx/danger/"..tostring(i)..".png")
        dangerGfx[i]:setFilter("nearest", "nearest")
end

activeGfx = 1

local r, g, b = 1, 1, 1

local alphaFade = 1
local scale = 2

function danger()

        carpet()

        love.graphics.setColor(0, 0, 0, .2)
        love.graphics.rectangle("fill", 0, 0, canvasW, canvasH)

        love.graphics.push()

        love.graphics.translate(canvasW / 2, canvasH / 2)

        if (audioKickHit == true) then

                scale = 2

                activeGfx = activeGfx + 1

                if (activeGfx > 8) then

                        activeGfx = 1
                end
        end

        if (scale < 6) then

                scale = scale + 4 * dt

                if (scale > 6) then

                        scale = 6
                end
        end

        love.graphics.scale(scale, scale)

        x = (0 - (dangerGfx[1]:getWidth() / 2))
        y = (0 - (dangerGfx[1]:getHeight() / 2))


        if (audioSnareHit == true) then

                if (r == 1) then

                        r, g, b = .6, .2, .2
                else
                        r, g, b = 1, 1, 1
                end

                alphaFade = 1
        end

        alphaFade = alphaFade - .7 * dt


        love.graphics.setColor(r, g, b, alphaFade)
        love.graphics.draw(dangerGfx[activeGfx], x, y, 0)

        love.graphics.pop()

        tvLogo()

        if (barCount == 57) then

                activeScene = dotWave
        end
end