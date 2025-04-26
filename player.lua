function _init_player()
    player = {
        x = 0,
        y=30,
        w=16,
        h=16,

        idle_s = .4,
        s = .8,
        sink= 7,
        down = false,
        up = true,

        momentum = 0,
        friction= 0.9,
        accel= 0.3,
        target_y=nil
    }
 
water_y=0;
end
  

function _update_player()
    -- Apply acceleration based on input
    if btn(➡️) then
        player.momentum = player.momentum + player.accel
    elseif btn(⬅️) then
        player.momentum = player.momentum - player.accel
    else
        -- No input - just apply friction to slow down
        player.momentum = player.momentum * player.friction
    end
    
    -- Limit maximum momentum
    player.momentum = mid(-player.s * 1.5, player.momentum, player.s * 1.5)
    
    -- Apply momentum to position 
    player.x += player.momentum
    
    -- Apply idle drift if no movement keys are pressed
    if not btn(➡️) and not btn(⬅️) then
        friction= 0
        player.x += player.idle_s
    else
        player.friction= 0.9
    end

        if player.x >= 128 then
            player.x = -13
        else
            if player.x <= -14 then
                player.x = 128
            end
            if btn (⬇️) and player.sink<8 then
                player.sink += 0.4
                player.down=true
                sprite_num=6
                player.friction = 0.99

            else if player.sink > 7 then
                player.sink -= 0.4
            else
                player.down=false
                player.friction = 0.9
    
            end
            if btn (⬆️) then
                player.up=true
                sprite_num=8
                player.friction = 0.8
            else
                player.up = false
                player.friction = 0.9
            end
            end

            local player_center_x = flr(player.x + player.w/2)
            player_center_x = mid(0, player_center_x, 127)
            
            if wave_points and wave_points[player_center_x] then
                 water_y = wave_points[player_center_x]
                
                if player.down or sleep == true then
                    -- When down, use stronger smoothing
                    local target_position = water_y - player.h + player.sink
                    
                    -- Initialize target_y if nil
                    if not player.target_y then
                        player.target_y = target_position
                    end
                    
                    -- lerp with a small value = smooth
                    player.target_y = lerp(player.target_y, target_position, 0.03)
                    player.y = player.target_y
                else
                    -- When not down, reset smoothing and follow water directly
                    player.target_y = nil
                    player.y = water_y - player.h + player.sink
                end
            end
        end


function _draw_player()
    spr(sprite_num, player.x, player.y, 2, 2)  

if sleep == true then
    
    player.idle_s = -.3
else 
    player.idle_s = .4
end
end
end


function lerp(a, b, t)
    return a + (b - a) * t
end


