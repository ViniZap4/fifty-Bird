Pipe = Class()

function Pipe:init(orientation. y)
  self.image = Img.new("pipe.png")
  self.x = VIRTUAL_WIDTH + 60
  self.y = y

  -- dimentions
  self.width = PIPE_WIDTH
  self.height = PIPE_HEIGHT

  -- orientation
  self.orientation = orientation

end

function Pipe:update() end

function Pipe:render()
  
  love.graphics.draw(
    self.image,
    self.x, (self.orientation == 'top' and self.y + PIPE_HEIGHT or self.y), 
    0, 1,  
    self.orientation == 'top' and -1 or 1 -- scale
  )

end