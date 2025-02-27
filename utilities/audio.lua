function audioInit(mute)

        beatDiff = 369

        -- generate beat hit table

        beatHit = { }
        --beatHitTotal = 320
        beatHitTotal = 368

        for i = 1, beatHitTotal do

                beatHit[i] = beatDiff * i
        end

        beatHit[1] = 0

        beatCount = 1

        -- generate snare hit table
        snareHit = { }
        snareHitTotal = beatHitTotal / 2

        for i = 1,snareHitTotal do

                snareHit[i] = (beatDiff * (i * 2)) + beatDiff
        end

        snareCount = 1

        -- generate bar hit table

        barHit = { }
        barHitTotal = 92

        for i = 1,barHitTotal do

                barHit[i] = beatDiff * (i * 4)
        end

        barHit[1] = 0

        barCount = 1

        -- generate half bar hit table

        halfBarHit = { }
        halfBarHitTotal = barHitTotal * 2

        for i = 1,halfBarHitTotal do

                halfBarHit[i] = beatDiff * (i * 2)
        end

        halfBarHit[1] = 0

        halfBarCount = 1


        -- kick hit table
        -- 2966
        kickHitBase = { 0, 560, 1485, 1670, 2040, 2410 }
        kickHitTotal = barHitTotal * 6

        kickHit = { }

        j = 1

        --barStart = 2966
        barStart = 23498

        for i = 1, kickHitTotal do

                kickHit[i] = barStart + kickHitBase[j]

                j = j + 1

                if (j > 6) then

                        j = 1
                        barStart = barStart + 2966
                end
        end

        kickCount = 1

        --

        if (mute == nil) then

                audio = love.audio.newSource("pgx2.mp3", "stream")
                love.audio.play(audio)
        end

        audioStart = love.timer.getTime() * 1000
end

function audioSync()

        audioTimer =  (love.timer.getTime() * 1000) - audioStart

        -- bars

        if (audioTimer >= barHit[barCount]) then

                audioBarHit = true
                barCount = barCount + 1

                if (barCount > barHitTotal) then

                        audioInit("mute")
                end
        else

                audioBarHit = nil
        end

        -- half bars

        if (audioTimer >= halfBarHit[barCount]) then

                audioHalfBarHit = true
                halfBarCount = halfBarCount + 1
        else
                audioHalfBarHit = nil
        end

        -- beats

        if (audioTimer >= beatHit[beatCount]) then

                audioBeatHit = true
                beatCount = beatCount + 1
        else

                audiobeatHit = nil
        end

        -- snares

        if (audioTimer >= snareHit[snareCount]) then

                audioSnareHit = true
                snareCount = snareCount + 1
        else

                audioSnareHit = nil
        end

        if (audioTimer >= kickHit[kickCount]) then

                audioKickHit = true
                kickCount = kickCount + 1
        else

                audioKickHit = nil
        end
end