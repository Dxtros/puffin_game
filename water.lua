
function _waterinit()
wave_speed = 0 --time/animation counter
wave_h = 40 --vertical starting pos
amp = 1.9 --wave height
freq = .02 --frequency of waves
end

function _waterupdate()
wave_speed += 0.01 -- increment timer
end

function _waterdraw()
    local wave_points = {} --store wave y-positions

    for x=0,127 do
        local y= wave_h + sin(x*freq + wave_speed)*amp
        wave_points[x]= y
        pset(x,y,11)
    end
    for x=0, 127 do 
        rectfill(x, wave_points[x]+1,x,127,11)
    end
end
