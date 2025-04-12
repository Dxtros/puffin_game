

function _init()
    poke(0x5f2e,1)
    _initAnim()

    positionx = 0
    speed = .8
    rectfill(0,45,45,128,12)
    
end

function _update()
    if btn(➡️) then
        positionx += 1 * speed
    end

    if btn(⬅️) then
        positionx -= 1 * speed
    end
    if positionx>=128 then
    positionx=-13
    else if positionx<=-14 then
        positionx=128
    end
end
_spriteAnim()
end

function _draw()
    cls(28)
    rectfill(0,0,128,45,1)
    spr(sprite_num, positionx, 50,2,2)
end