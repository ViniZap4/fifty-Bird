PlayState = createState()

PIPE_SPEED = 60
PIPE_WIDTH = 70
PIPE_HEIGHT = 288

BIRD_WIDTH = 38
BIRD_HEIGHT = 24

function PlayState:init()
  self.bird = Bird()
end

function PlayState:update(dt)
  self.bird:update(dt)
end

function PlayState:render()

  self.bird:render()

end