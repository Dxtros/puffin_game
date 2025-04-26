function _init()
    poke(0x5f2e, 1)

    _waterinit()

    _initAnim()
_init_player()
_init_particles()
init_zzz()
fish_init()
    
end

function _update()
    _update_player()

    _spriteAnim()
    _sleepTimer()

    _waterupdate()
    _update_particles()
    update_zzz()
    fish_update()
end

function _draw()
    pal(11, 12 + 128, 1)
    --color 11 (is darker blue
    pal(9, 9 + 128, 1)
    pal(1, 0, 1)
    --color 1 is black
    pal(3, 1, 1)
    cls(11)
    _waterdraw()
    _draw_player()
    _draw_particles()
    draw_zzz()
    fish_draw()
end