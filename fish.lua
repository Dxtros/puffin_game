-- fish variables
fish = {}

function fish_init()
  -- initialize fish properties
  fish.x = -30         -- start off-screen to the left
  fish.y = 100       -- middle of the screen vertically
  fish.speed = .09      -- horizontal movement speed
  fish.sprite = 13    -- sprite number in the spritesheet
  fish.flip_x = false -- direction facing (false = right, true = left)
  fish.anim_timer = 0 -- animation timer
  fish.anim_speed = 0.09 -- animation speed
  fish.wobble = 0     -- vertical wobble amount
min_y = 80   -- upper bound (top of screen is 0)
max_y = 115  -- lower bound
-- curious behavior variables
fish.state = "swimming" -- current state: swimming, pausing, or darting
fish.state_timer = 0    -- timer for current state
fish.target_y = fish.y  -- target y position to swim toward
fish.curious_timer = 0  -- timer for curiosity actions
end

function fish_update()
-- update timers
fish.anim_timer = fish.anim_timer + fish.anim_speed
fish.state_timer = fish.state_timer + 1
fish.curious_timer = fish.curious_timer + 1
fish.y = mid(min_y, fish.y, max_y)
-- handle different fish states
if fish.state == "swimming" then
  -- normal swimming behavior
  fish.x = fish.x + fish.speed * (fish.flip_x and -0.8 or 1)
  
  -- gradually move toward target_y for vertical movement
  if abs(fish.y - fish.target_y) > 0.5 then
    fish.y = fish.y + (fish.target_y > fish.y and 0.3 or -0.3)
  end
  
  -- occasionally change state
  if fish.curious_timer > 60 + rnd(120) then
    fish.curious_timer = 0
    
    -- randomly choose new state
    local r = rnd(10)
    if r < 3 then
      -- pause and look around
      fish.state = "pausing"
      fish.state_timer = 0
    elseif r < 5 then
      -- dart quickly
      fish.state = "darting"
      fish.state_timer = 0
      fish.target_y = mid(min_y, fish.target_y, max_y)
    elseif r < 7 then
      -- change direction
      fish.flip_x = not fish.flip_x
      fish.state_timer = 0
    else
      -- just change vertical target
      fish.target_y = mid(min_y, fish.target_y, max_y)
    end
  end
  
elseif fish.state == "pausing" then
  -- slow down animation while pausing
  fish.anim_speed = 0.03
  
  -- pause for a moment, slight vertical movement
  fish.y = fish.y + sin(fish.wobble * 0.5) * 0.2
  
  -- resume swimming after pause
  if fish.state_timer > 20 + rnd(30) then
    fish.state = "swimming"
    fish.anim_speed = 0.08
    fish.target_y = mid(min_y, fish.target_y, max_y)
  end
  
elseif fish.state == "darting" then
  -- quick darting movement
  fish.x = fish.x + fish.speed * 2 * (fish.flip_x and -1 or 1)
  fish.y = fish.y + (fish.target_y > fish.y and 0.8 or -0.8)
  
  -- return to normal swimming
  if fish.state_timer > 15 or abs(fish.y - fish.target_y) < 2 then
    fish.state = "swimming"
  end
end

-- add a slight vertical wobble for swimming motion
fish.wobble = fish.wobble + 0.05



-- wrap around screen when fish exits either side
if fish.x > 128 then
  fish.x = -8
  fish.target_y = mid(min_y, fish.target_y, max_y)
elseif fish.x < -8 then
  fish.x = 128
  fish.target_y = mid(min_y, fish.target_y, max_y)
end
end

function fish_draw()
-- draw the fish sprite
spr(fish.sprite, 
    fish.x, 
    fish.y + sin(fish.wobble) * 1.5, 
    1, 1, 
    fish.flip_x)
end