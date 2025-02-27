local overlayText = "iodine-131"
local overlayFont = love.graphics.newFont("/font/Paskowy.ttf", 320)
local textAlpha = 1
local textScale = 1

local rotozoomTex = { }

for i = 1,8 do

        rotozoomTex[i] = love.graphics.newImage("/gfx/danger/"..tostring(i)..".png")
end

local pattern = 1
local scaleMod = 0

function rotozoom()

        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle("fill", 0, 0, canvasW, canvasH)

        local scale = (math.cos(c / 3) * .3) + .7
        local scale = .7
        local zoomX = (rotozoomTex[1]:getWidth() * scale) + 16
        local zoomY = (rotozoomTex[1]:getHeight() * scale) + 16
        local w     = canvasW
        local h     = canvasH
        local angle = c / 3.5

        love.graphics.setColor(255, 255, 255, 1)


        love.graphics.translate(w / 2, h / 2)
        love.graphics.rotate(-angle)

        i = 1

        j = 1

        if (audioKickHit == true) then

                genTexColourTab()
        end

        if (audioSnareHit == true) then

                genTexColourTab()

                scaleMod = .2
        end

        if scaleMod > 0 then

                scaleMod = scaleMod - .2 * (dt * 4)

                if scaleMod < 0 then

                        scaleMod = 0
                end
        end

        for x = -w,w,zoomX do

                for y = -w,w,zoomY do

                        love.graphics.setColor(texColourTab[j])

                        love.graphics.draw(rotozoomTex[i], x, y, (angle * 4) - (j / i), scale + scaleMod, scale + scaleMod)

                        i = i + 1

                        if (i > 8) then

                                i = 1
                        end

                        j = j + 1
                end
        end

        love.graphics.rotate(angle)
        love.graphics.translate(-w/2, -h/2)


        love.graphics.push()

        love.graphics.translate((canvasW / 2) , (canvasH / 2))

        love.graphics.scale(textScale, textScale)

        if (textScale > 0) then

                textScale = textScale - .5 * dt
        end

        -- draw text
        love.graphics.setFont(overlayFont)

        textAlpha = textAlpha - .5 * dt

        x = 0 - (overlayFont:getWidth(overlayText) / 2)
        y = 0 - (overlayFont:getHeight(overlayText) / 2)

        love.graphics.setColor(0, 0, 0, textAlpha - .1)
        love.graphics.print(overlayText, x + 4, y + 4)
        love.graphics.setColor(1, 1, 1, textAlpha)
        love.graphics.print(overlayText, x, y)


        -- outline
        --love.graphics.rectangle("line", x - 32, y - 24, textW + 64, textH + 32, 64, 64)

        love.graphics.pop()


        tvLogo()

        if (barCount == 41) then

                activeScene = danger
        end
end

function genTexColourTab()

        texColourTab = { }

        for i = 1,2593 do

                local rnd = math.random(0, 7)

                if rnd == 1 then

                        texColourTab[i] = { .6, .2, .2, .7 }

                elseif rnd == 4 then

                        texColourTab[i] = { 1, 1, 1, .7 }

                else

                        texColourTab[i] = { .7, .7, .7, .7 }
                end
        end
end

genTexColourTab()