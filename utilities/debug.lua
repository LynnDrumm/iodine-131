--dmDebugMode             = 0
dmScreenSafe            = 0

debugFontSize           = 18
debugFont               = love.graphics.newFont("font/C64_Pro_Mono-STYLE.ttf", debugFontSize)
debugDisplayX           = 8
debugDisplayY           = 8
debugDisplayShadowX     = debugDisplayX + 2
debugDisplayShadowY     = debugDisplayY + 2
debugDisplayLineOffset  = debugFontSize

local function titleSafe()

        x = love.graphics.getWidth() * .05
        y = love.graphics.getHeight() * .05
        w = love.graphics.getWidth() * .9
        h = love.graphics.getHeight() * .9

        love.graphics.setLineWidth(1)
        love.graphics.setColor(0, 255, 0, 255)
	love.graphics.rectangle("line", x, y, w, h)
end

local function actionSafe()

        x = love.graphics.getWidth() * .025
        y = love.graphics.getHeight() * .025
        w = love.graphics.getWidth() * .95
        h = love.graphics.getHeight() * .95

        love.graphics.setColor(255, 0, 0, 255)
	love.graphics.rectangle("line", x, y, w, h)
end

function showDebug()

        if dmScreenSafe == 1 then

                -- indicate safe areas

                titleSafe()
                actionSafe()
        end

	if dmDebugMode == 1 then

                love.graphics.setFont(debugFont)

                debugDisplayX   = 8

                love.graphics.setColor(.2, .2, .2, .7)
                love.graphics.rectangle("fill", debugDisplayX - (debugDisplayX / 1.5), debugDisplayY - (debugDisplayY / 1.5), 480, debugFontSize * 6)

                local fps       = love.timer.getFPS()
                local frt       = string.sub(frt, 0, 4)
                local dt        = string.sub(dt, 0, 6)
                local c         = math.floor(c)
                local d012      = math.floor(activeRasterLine)

                love.graphics.setColor(255,255,255)
                love.graphics.print(" FPS: "..tostring(fps), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 0))
                love.graphics.print(" FRT: "..tostring(frt).."ms", debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 1))
                love.graphics.print("  DT: "..tostring(dt), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 2))
                love.graphics.print("   C: "..tostring(c), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 3))
                love.graphics.print("d012: "..tostring(d012), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 4))

                debugDisplayX = debugDisplayX + 230

                -- second collumn
                --local aTime     = math.floor(audioTimer)
                love.graphics.print("aTime: "..tostring(aTime), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 0))
                love.graphics.print("  bar: "..tostring(barCount), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 1))
                love.graphics.print(" beat: "..tostring(beatCount), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 2))
                love.graphics.print(" kick: "..tostring(kickCount), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 3))
                love.graphics.print("snare: "..tostring(snareCount), debugDisplayX, debugDisplayY + (debugDisplayLineOffset * 4))
        end
end