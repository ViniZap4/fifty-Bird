PipePair = Class{}

-- size of the gap between pipes
local GAP_HEIGHT = 90

function PipePair:init(y)
  self.scored = false

  -- position for init
  self.x = VIRTUAL_WIDTH + 32

  self.y = y

  self.pipes = {
    ['upper'] = Pipe('top', self.y),
    ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + GAP_HEIGHT)
  }

  self.remove = false
end

function PipePair:update(dt)

  -- remove if 
  if self.x > -PIPE_WIDTH then
    self.x = self.x - PIPE_SPEED * dt
    self.pipes['lower'].x = self.x
    self.pipes['upper'].x = self.x
  else
    self.remove = true
  end

end

function PipePair:render(y)

  --render all pipes in self.pipes
  for l, pipe in pairs(self.pipes) do
    pipe:render()
  end

end