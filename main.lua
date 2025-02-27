-- the actual size of the demo
canvasW, canvasH           = 1920, 1080
-- the size of the window, as in the output window to watch pretty effects on
local windowW, windowH     = 1920, 1080
-- the size of the monitor, for setting fullscreen
local monitorW, monitorH   = love.window.getDesktopDimensions()
--local fullscreenType       = "exclusive"
local vsync                = true
local borderless           = true
local msaa                 = 0
-- opens a window in the top right of the screen for development purposes. should be disabled before release.
local devMode              = true

require "require"

function love.load()

        print("Psychographics Demoscene Research")

        love.window.setTitle("pgxDemosystem")

        major, minor, revision, codename = love.getVersion()
        --version = major.."."..minor.."."..revision.." / "..codename

        print("Love2D version: "..tostring(major).."."..tostring(minor).."."..tostring(revision).." / "..tostring(codename).."\n")

        -- set global canvas
        canvas  = love.graphics.newCanvas(canvasW, canvasH)
        window  = love.graphics.newCanvas(windowW, windowH)

        print("Canvas: "..tostring(canvasW).." * "..tostring(canvasH))
        print("Window: "..tostring(windowW).." * "..tostring(windowH))

        -- open screen
        if devMode == true then

                love.window.setMode(windowW, windowH, {fullscreen=false, centered=false, x=(monitorW - windowW), y=0, vsync=vsync, borderless=borderless, msaa=msaa})
                dmDebugMode = 1
        else

                dmDebugMode = 0
                fullscreenSwitch(true)
                love.window.setMode(windowW, windowH, {fullscreen=false, fullscreentype=fullscreenType, vsync=vsync, borderless=borderless, msaa=msaa})
        end

        -- disable mouse
        love.mouse.setVisible( false )

        -- initialize counter
        c  = 0

        -- set filter to nearest neighbour for that hard edge
        love.graphics.setDefaultFilter("nearest", "nearest")

        -- set frameRenderTime initial start
        frtStart = (love.timer.getTime() * 1000)

        -- "require" all needed files.
        --require("utilities.lurker")
        requireInit()

        activeScene = shapePlasma

        love.timer.sleep(5)

        audioInit()
end

function love.update()

        -- auto update/replace files during runtime. Remove before release.
        --require("utilities.lurker").update()

        frt = (love.timer.getTime() * 1000) - frtStart

        dt = love.timer.getDelta()
        c  = c + dt

        audioSync()

        frtStart = (love.timer.getTime() * 1000)
end

function love.draw()

        love.graphics.setCanvas(canvas)
        love.graphics.clear()

        activeScene()

        --rotozoom()


        --offset, intensity, mask
        rgbDisplace(2, .8, .9)

        scanlines(true)

        love.graphics.setCanvas()

        love.graphics.setColor(1, 1, 1, 1)

        -- scale canvas to screen
        love.graphics.draw(canvas, 0, 0, 0, windowW / canvasW, windowH / canvasH)

        -- debug display
        --showDebug()
end

function fullscreenSwitch(fullscreen)

        if fullscreen == true then

                windowWold = windowW
                windowHold = windowH

                windowW = monitorW
                windowH = monitorH
        else

                windowW = windowWold
                windowH = windowHold
        end
end

