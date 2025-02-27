local font = love.graphics.newFont("font/BebasNeue.otf", 256)
local scale = 6
local greetList = { "Alcatraz",
                    "Altair",
                    "Cocoon",
                    "Conspiracy",
                    "Desire",
                    "Digital Sounds System",
                    "Furry Trash Group",
                    "Holon",
                    "Logicoma",
                    "Loonies",
                    "Mercury",
                    "Ninjadev",
                    "Poo-Brain",
                    "Spaceballs",
                    "Still",
                    "TRBL"
                  }

local greetListIndex = 1
local greetListSize = table.getn(greetList)
local textAlpha = 1

function dotWave()

        love.graphics.push()

        love.graphics.translate(canvasW / 2, canvasH / 2)

        love.graphics.scale(scale, scale)

        love.graphics.rotate(c / 3)

        w = 320
        h = 320

        i = 0

        for y = -h, h, 16 do

                for x = -w, w, 16 do

                        if (i % 2 == 0) then

                                love.graphics.setColor(.7, .7, .7, .9)
                                love.graphics.circle("line", (math.cos((c * 4) + i * 4) * 4) + x, (math.sin((c * 4) + i) * 4) + y, 8, 8)
                        else

                                love.graphics.setColor(.6, .2, .2, .9)
                                love.graphics.circle("fill", (math.cos((c * 4) + i * 4) * 4) + x, (math.sin((c * 4) + i) * 4) + y, 8, 8)
                        end

                        i = i + 1
                end
        end

        love.graphics.pop()

        -- greets

        love.graphics.push()

        love.graphics.translate(canvasW / 2, canvasH / 2)

        love.graphics.setFont(font)

        x = 0 - font:getWidth(greetList[greetListIndex]) / 2
        y = 0 - font:getHeight(greetList[greetListIndex]) / 2

        love.graphics.setColor(1, 1, 1, textAlpha)

        love.graphics.print(greetList[greetListIndex], x, y)

        if (audioBarHit == true) then

                if (greetListIndex < greetListSize) then

                        greetListIndex = greetListIndex + 1
                        textAlpha = 1
                end
        end

        textAlpha = textAlpha - .3 * dt

        love.graphics.pop()

        tvLogo()

        if (barCount == 73) then

                activeScene = twister
        end

end