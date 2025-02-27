activeRasterLine = 1

function scanlines(active)

        if active == true then

                love.graphics.setLineWidth(1)
                y = 1

                while y < canvas:getHeight() do

                        love.graphics.setColor(0, 0, 0, .7)
                        love.graphics.line(0, y, canvas:getWidth(), y)

                        y = y + 3
                end

                -- activeRasterLine

                love.graphics.setLineWidth(4)
                love.graphics.setColor(255, 255, 255, .02)
                love.graphics.line(0, activeRasterLine, canvas:getWidth(), activeRasterLine)

                activeRasterLine = activeRasterLine + (canvas:getHeight() / 2) * dt

                if activeRasterLine > canvas:getHeight() then

                        activeRasterLine = 0
                end
        end
end