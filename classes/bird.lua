Bird = Class()

local gravity = 20

function Bird:init()
  self.image = Img:new("bird.png")

  -- get dimentions
  self.width = Img:getW(self)
  self.height = Img:getH(self)
  
  -- set position
  self.x = (VIRTUAL_WIDTH / 2 ) - (self.width/2)
  self.y = (VIRTUAL_HEIGHT / 2) - (self.height/2)

end

function Bird:update(dt)
end

function Bird:collides(pipe)
end

function Bird:render()

  love.graphics.draw(
    self.image,
    self.x, self.y
  )

end