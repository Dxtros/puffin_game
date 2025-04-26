-- Initialize this at the top of your code
zzz_particles = {}
zzz_timer = 0

-- Add to your _init() function
function init_zzz()
  zzz_particles = {}
  zzz_timer = 0
end

-- Add to your _update() function
function update_zzz()
  if sleep == true then
    -- Increment timer
    zzz_timer += 1
    
    -- Create new Z every 15 frames
    if zzz_timer % 20 == 0 then
      -- Add a new Z particle
      add(zzz_particles, {
        x = player.x + rnd(6) + 2,  -- Random x near player
        y = player.y - 3,           -- Start above player
        size = 0.7,                 -- Smaller size
        life = 0                    -- Current lifetime
      })
    end
    
    -- Update existing particles
    for i=#zzz_particles,1,-1 do
      local z = zzz_particles[i]
      z.y -= 0.5         -- Float upward
      z.life += 1        -- Increase lifetime
      
      -- Remove if too old (40 frames)
      if z.life > 40 then
        deli(zzz_particles, i)
      end
    end
  else
    -- Clear all particles when not sleeping
    zzz_particles = {}
  end
end

-- Add to your _draw() function
function draw_zzz()
  if sleep == true then
    for z in all(zzz_particles) do
      -- Only draw if still visible
      if z.life < 40 then
        -- Draw the sprite with scaling
        spr(12, z.x, z.y, 1, 1)
      end
    end
  end
end