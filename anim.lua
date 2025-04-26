function _initAnim()
    sprite_num = 2
    s_timer = 0
    sleep_time = 0
    asleep_timer= 0
    sleep = false
    wake_sleep_time= flr(20 + rnd(80))
    cycle_timer=0
end

function _spriteAnim()
    if s_timer < 10 then
        s_timer += 1
    else
        if sprite_num < 4 and player.down == false and player.up == false and sleep == false then
            sprite_num += 2
        else
            if player.down == false and player.up == false and sleep == false then
            sprite_num = 2
            end
        end
        s_timer = 2
    end
end
function _sleepTimer()
    if cycle_timer>=101 then
        wake_sleep_time= flr(50 + rnd(100))
        printh(wake_sleep_time)
        cycle_timer = 0
    else
        cycle_timer += .05
    end
    
    if btn(0) or btn(1) or btn(2) or btn(3) or asleep_timer>= wake_sleep_time then
        sleep_time = 0
asleep_timer= 0
        sleep = false
      
        
    else
        sleep_time += .05

    end
    if sleep_time >= wake_sleep_time then
        sprite_num=10
        sleep = true
        asleep_timer += .05
        


    end
end

