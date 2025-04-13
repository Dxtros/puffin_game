function _waterinit()
    wave_speed = 0
    --time/animation counter
    wave_h = 40
    --vertical starting pos
    amp = 1.4
    --wave height
    freq = .01
    --frequency of waves
    secondary_freq = .02
    secondary_amp = 1.9
    waveoffset = .1
end

function _waterupdate()
    wave_speed += 0.01
    -- increment timer
end

function _waterdraw()
    local wave_points = {}
    --store wave y-positions

    for x = 0, 127 do
        main_wave = sin(x * freq + wave_speed) * amp
        secondary_wave = sin(x * secondary_freq + wave_speed * waveoffset) * secondary_amp

        local y = wave_h + main_wave + secondary_wave
        wave_points[x] = y

        pset(x, y - 2, 7)
    end
    for x = 0, 127 do
        rectfill(x, wave_points[x] + 1, x, 127, 11)
    end
end