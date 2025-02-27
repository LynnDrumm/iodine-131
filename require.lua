function requireInit()

        -- directories to find files to require
        local dirTable  = { "utilities", "overlayFx", "scenes" }
        local countDirs = 1
        local totalDirs = table.getn(dirTable)

        print("\nRequiring requires... ("..tostring(totalDirs).." dirs)")

        -- iterate through the directories
        while countDirs <= totalDirs do

                -- get all the filenames in the directory
                local fileTable  = love.filesystem.getDirectoryItems(dirTable[countDirs])
                local countFiles = 1
                local totalFiles = table.getn(fileTable)
                local dir        = dirTable[countDirs]

                print("\n    reading directory "..tostring(dir).." ("..tostring(totalFiles).." files)\n")

                while countFiles <= totalFiles do

                        print("        "..tostring(countFiles)..". "..tostring(fileTable[countFiles]))

                        local file = fileTable[countFiles]
                        local path = dir .."/".. file
                        require(path:match("(.*)%.lua"):gsub("/","."))

                        countFiles = countFiles + 1
                end

                countDirs = countDirs + 1
        end
end