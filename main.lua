 poke(0x5f2e,1)

function _init()
    positionx = 0
    speed = 2
    
end

function _update()
    if btn(➡️) then
        positionx += 1 * speed
    end

    if btn(⬅️) then
        positionx -= 1 * speed
    end
    if positionx>128 then
    positionx=-17
    else if positionx<-16 then
        positionx=128
    end
end
end

function _draw()
    cls(28)
    spr(2, positionx, 50,2,2)
end