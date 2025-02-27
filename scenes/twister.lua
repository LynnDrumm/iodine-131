local texture = love.graphics.newImage("/gfx/twister2.png")
local sliceTable = { }

for i = 1,texture:getWidth() do

        sliceTable[i] = love.graphics.newQuad(i, 0, 1, texture:getHeight(), texture:getWidth(), texture:getHeight())
end

local twAngle = math.random()
local twSinMod = math.random(64, 512)
local bgAngle = math.random()
local bgSinMod = math.random(64, 512)

local bgTex = love.graphics.newImage("/gfx/bgtex.png")
local bgRot = 0

function twister()

        love.graphics.push()

        bgRot = bgRot - .1 * dt

        love.graphics.translate(canvasW / 2, canvasH / 2)
        love.graphics.rotate(bgRot)

        love.graphics.setColor(.25, .25, .25, 1)

        love.graphics.draw(bgTex, -(bgTex:getWidth() / 2), -(bgTex:getHeight() / 2))

        love.graphics.pop()

        if (audioSnareHit == true) then

                twAngle = math.random()
                twSinMod = math.random(128, 256)

                bgAngle = math.random()
                bgSinMod = math.random(128, 256)
        end

        drawTwister(bgAngle, bgSinMod, .5)

        drawTwister(twAngle, twSinMod, 0)

        tvLogo()
end

--
function drawTwister(angle, sinMod, alpha)

        love.graphics.push()

        love.graphics.translate(canvasW / 2, canvasH / 2)

        local w = texture:getWidth()
        local h = texture:getHeight()
        local x = -w / 2
        local y = -h / 2

        love.graphics.rotate(angle)

        for i = 1,w do

                local scaleH = math.sin(c + (i / (sinMod * 4)))
                local scaleY = math.sin(c + (i / (sinMod * 2))) * sinMod

                if scaleH > 0 then

                        love.graphics.setColor(1, .4, .4, 1 - alpha)

                else

                        love.graphics.setColor(1, 1, 1, 1 - alpha)

                end

                love.graphics.draw(texture, sliceTable[i], x + i, y + scaleY, 0, 2, scaleH)
        end

        love.graphics.pop()

        -- jump at bar 89

        if (barCount == 89) then

                activeScene = credits
        end

end