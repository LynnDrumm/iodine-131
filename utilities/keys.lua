function love.keypressed(key)

        if key == "escape" then

                love.event.push("quit")

        elseif key == "f3" then

                if dmDebugMode == 1 then

                        dmDebugMode = 0
                else

                        dmDebugMode = 1
                end

        elseif key == "f4" then

                if dmScreenSafe == 1 then

                        dmScreenSafe = 0
                else
                        dmScreenSafe = 1
                end

        elseif key == "f5" then

                -- force reload requires
                --requireInit()

                lurker.scan()

        elseif key == "f11" then

                if love.window.getFullscreen() == false then

                        fullscreenSwitch(true)
                        love.window.setFullscreen(true)

                else

                        fullscreenSwitch(false)
                        love.window.setFullscreen(false)
                end
        end
end