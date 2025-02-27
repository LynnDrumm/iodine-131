local overlayText = "iodine-131"
local overlayFont = love.graphics.newFont("/font/Paskowy.ttf", 320)
local textAlpha = 1

local overlayGfx = love.graphics.newImage("gfx/pgx2.png")
local logoFade = 0

local r, g, b = 1, 1, 1
local plasmaFade = 78

function shapePlasma()

        -- scale to lores

        love.graphics.push()
        love.graphics.scale(6, 6)

        w = 320
        h = 180

        -- audio sync

        if (barCount < 16) then

                if (audioBarHit == true) then

                        r, g, b = .8, .8, .8
                end

                --r = r - .5 * (dt * 1)
                --g = g - .6 * (dt * 1)
                --b = b - .6 * (dt * 1)

        else
                if (audioKickHit == true) then

                        r, g, b = .6, .2, .2
                end

                r = r + .1 * (dt * 4)
                g = g + .2 * (dt * 4)
                b = b + .2 * (dt * 4)
        end




        -- fade in plasma

        if (barCount > 31) then

                plasmaFade = plasmaFade + 40 * dt

                r = r - .1 * (dt * 2)
                g = g - .1 * (dt * 2)
                b = b - .1 * (dt * 2)

        elseif (barCount > 3) then

                if (plasmaFade > 32) then

                        plasmaFade = plasmaFade - 2 * dt
                end
        end



        -- draw plasma

        x = 1

        while x < w do

                y = 1

                sin = 128 + (128 * math.sin((c * 2) + x / 16))

                while y < h do

                        k = sin + 128 + (128 * math.sin((c * 2) + y / 16)) + 128 + (128 * math.sin((x + y) / 32)) + 128 + (128 * math.sin(math.sqrt(x * y + x * y) / 8)) / 8

                        k = k / 4
                        love.graphics.setColor(r, g, b, 1)
                        love.graphics.circle("fill", x + 1, y + 1, 1.9, k / plasmaFade)

                        y = y + 5
                end

                x = x + 5
        end

        love.graphics.pop()

        -- overlayGfx

        love.graphics.push()

        if (barCount < 13) then

                if (logoFade < 1) then

                        logoFade = logoFade + .2 * dt

                        if logoFade > 1 then

                                logoFade = 1

                        end
                end

        elseif (barCount > 12) then

                if (logoFade > 0) then

                        logoFade = logoFade - .2 * dt

                        if logoFade < 0 then

                                logoFade = 0
                        end
                end
        end

        love.graphics.translate((canvasW / 2) - (overlayGfx:getWidth() / 2), (canvasH / 2) - (overlayGfx:getHeight() / 2))

        love.graphics.setColor(1, 1, 1, logoFade)
        love.graphics.draw(overlayGfx, 0, 0)

        love.graphics.pop()

        if (barCount > 16) then

                love.graphics.push()

                love.graphics.translate((canvasW / 2) - (overlayFont:getWidth(overlayText) / 2), (canvasH / 2) - (overlayFont:getHeight(overlayText) / 2))

                -- draw text
                love.graphics.setFont(overlayFont)

                if (barCount > 30) then

                        --textAlpha = textAlpha - 1 * dt
                end

                love.graphics.setColor(0, 0, 0, textAlpha - .1)
                love.graphics.print(overlayText, 4, 4)
                love.graphics.setColor(1, 1, 1, textAlpha)
                love.graphics.print(overlayText, 0, 0)


                -- outline
                --love.graphics.rectangle("line", x - 32, y - 24, textW + 64, textH + 32, 64, 64)

                love.graphics.pop()

        end

        if (barCount == 33) then

                activeScene = rotozoom
        end
end