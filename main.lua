function _init()
    poke(0x5f2e, 1)

    _waterinit()

    _initAnim()

    positionx = 0
    idle_s = .3
    speed = .8
end

function _update()
    if btn(➡️) then
        positionx += 1 * speed
    end

    if btn(⬅️) then
        positionx -= 1 * speed
    else
        positionx += 1 * idle_s
    end

    if positionx >= 128 then
        positionx = -13
    else
        if positionx <= -14 then
            positionx = 128
        end
    end
    _spriteAnim()

    _waterupdate()
end

function _draw()
    pal(11, 12 + 128, 1)
    --color 11 (is darker blue
    pal(9, 9 + 128, 1)
    pal(1, 0, 1)
    --color 1 is black
    pal(3, 1, 1)
    cls(12)
    _waterdraw()
    -- rectfill(0,0,128,45,1)
    spr(sprite_num, positionx, 50, 2, 2)
end