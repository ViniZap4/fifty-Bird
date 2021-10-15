require "components/imports"

-- import images and respective scroll variables

local background = Img:new("background.png")
local backgroundScroll = 0

local ground = Img:new("ground.png")
local groundScroll = 0

-- scrolling variables
local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413

-- Set screen dimensions

-- screen
WINDOW_WIDTH = 1280
WIDOW_HEIGHT = 720

-- virtual screen 
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288



function love.resize(w,h)
  push:resize(w, h)
end

function love.load()

  love.window.setTitle('Fifty Bird')

  -- using nearest-neighbor filter for prevent to blur
  love.graphics.setDefaultFilter('nearest', 'nearest')

  -- seed the RNG
  math.randomseed(os.time())

  Font:set(flappyFont)

  -- init music 
  sounds['music']:setLooping(true)
  sounds['music']:play()


  push:setupScreen(
    VIRTUAL_WIDTH, VIRTUAL_HEIGHT,
    WINDOW_WIDTH, WIDOW_HEIGHT,
    {
      fullscreen= false,
      resizable = true,
      vsync=true
    }
  )

  -- init with title state
  gameState:change('title')

end

function love.keypressed(key)
  
  -- add keys pressed 
  Input.keypressed[key] = true

  if key == "escape" then 
    love.event.quit()
  end

end

function love.mousepressed(x, y, button)
  Input.mousePressed[button] = true
end


function love.update(dt)

  backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
  groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH

  gameState:update(dt) 
  
  Input.keypressed = {}
  Input.mousePressed = {}
end

function love.draw()
  push:start() 
 
  love.graphics.draw(background, -backgroundScroll, 0)

  gameState:render()

  love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)

  push:finish()
end