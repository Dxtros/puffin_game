function _init_particles()
    parts = {}
 end
 
 function _update_particles()
    -- Create particles only at the water level (below the player)
    if every(.01) then 
       -- Calculate position to always be at or below the player's feet
       local spawn_y = water_y - player.h + player.sink+11.5  -- Position at the bottom of player
       
       add(parts, {
          x = player.x + player.w/2 + rnd(2) - 1,  -- Random spread behind player
          y = spawn_y,  -- Always at the player's feet/water level
          dx = -0.2 + rnd(0.4),  -- Slow drift backward
          dy = 0,  -- No vertical movement to keep at water level
          maxage = 20 + rnd(1),
          age = 0
       })
       if sleep then
       dx= 0.3 + rnd(0.4)
       end
    end
    
    -- Process all particles
    for i = #parts, 1, -1 do
       local p = parts[i]
       p.age += 1
       
       -- Horizontal movement only with slight wave pattern
       p.x += p.dx
       -- Very subtle horizontal wave pattern
       p.y += sin(time()/2 + p.x/20)*0.015
       
       -- Remove old particles
       if p.age > p.maxage then
          del(parts, p)
       end
    end
 end
 
 function _draw_particles()
    for p in all(parts) do
       -- Gentle fade based on age
       local fade = 1 - (p.age/p.maxage)
       
       -- Water colors - white to blue
       local col = 11 -- Dark blue
       if fade > 0.7 then
          col = 12 -- White for newest particles
       elseif fade > 0.4 then
          col = 12 -- Light blue for middle age
       end
       
       -- Draw small ripples
       pset(p.x, p.y, col)
       pset(p.x, p.y, col)
    end
 end
 
 -- Helper function for timing
 function every(frames)
    return t() % frames < 1/30
 end