PlayState = createState()

PIPE_SPEED = 60
PIPE_WIDTH = 70
PIPE_HEIGHT = 288

BIRD_WIDTH = 38
BIRD_HEIGHT = 24

function PlayState:init()
  self.bird = Bird()
  self.pipePairs = {}
  self.timer = 0 -- time for pipe spawn
  self.score = 0
  self.lastY = -PIPE_HEIGHT + math.random(80) + 20 -- spawn relative last spawn position
end

function PlayState:update(dt)
  self.timer = self.timer + dt
  

  -- spawn pipe
  if self.timer > 2 then

    local y = math.max(
      -PIPE_HEIGHT + 10,
      math.min(
        self.lastY + math.random(-20,20),
        VIRTUAL_HEIGHT - 90 - PIPE_HEIGHT
      )    
    )

    self.lastY = y

    --adding a new pipe
    table.insert(self.pipePairs, PipePair(y))

    --reset time
    self.timer = 0

  end

  -- update pipe pair table
  for k, pair in pairs(self.pipePairs) do

    --control socore in pipe pair
    if not pair.scored then
      -- if bird passed the pipe
      if pair.x + PIPE_WIDTH < self.bird.x then
        self.score = self.score +1
        pair.scored = true
        sounds["score"]:play()
      end
    end


    -- collision bird
    for l, pipe in pairs(pair.pipes) do
      if self.bird:collides(pipe) then

        sounds['explosion']:play()
        sounds['hurt']:play()
        
        gameState:change('score', {
          score = self.score
        })
      end
    end

    -- update position of pair
    pair:update(dt)

    -- remove pairs
    if pair.remove then
      table.remove(self.pipePairs, k)
    end
  end


  -- reset if bird get to the ground
  if self.bird.y > VIRTUAL_HEIGHT - 15  or self.bird.y < -100 then
    sounds['explosion']:play()
    sounds['hurt']:play()

    gameState:change('score', {
        score = self.score
    })
  end

  self.bird:update(dt)

end

function PlayState:render()

  for k, pair in pairs(self.pipePairs) do
    pair:render()
  end

  Font:print(
		"Score: " .. tostring(self.score),
		8, 8,  -- x, y
		flappyFont
	)
  self.bird:render()

end