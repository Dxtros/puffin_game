function _init_player()
    player = {
        x = 0,
        y= 30,
        w=16,
        h=16,

        idle_s = .3,
        s = .8,
        sink= 7
    }
end
function _update_player()
        if btn(➡️) then
            player.x += 1 * player.s
        end
    
        if btn(⬅️) then
            player.x -= 1 * player.s
        else
            player.x += 1 * player.idle_s
        end
    
        if player.x >= 128 then
            player.x = -13
        else
            if player.x <= -14 then
                player.x = 128
            end

            local player_center_x = flr(player.x + player.w/2)
            player_center_x = mid(0, player_center_x, 127)
            if wave_points and wave_points[player_center_x] then
                local water_y = wave_points[player_center_x]

                player.y = water_y - player.h + player.sink
        end
    end


function _draw_player()
    spr(sprite_num, player.x, player.y, 2, 2)  
end
end
