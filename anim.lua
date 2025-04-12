function _initAnim()
    sprite_num = 2
    s_timer = 0
end

function _spriteAnim()
    if s_timer < 10 then
        s_timer += 1
    else
        if sprite_num < 4 then
            sprite_num += 2
        else
            sprite_num = 2
        end
        s_timer = 2
    end
end
