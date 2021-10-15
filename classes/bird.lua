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

  self.vy = 0

end

function Bird:update(dt)
  -- gravity effect
  self.vy = self.vy + gravity * dt

  -- jump
  if  Input:wasPressed("space") or Input:mouseWasPressed(1) then 
    self.vy = -5
    sounds['jump']:play()
  end


  -- change position
  self.y = self.y + self.vy
end

function Bird:collides(pipe)
  -- is between x axis
  if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + PIPE_WIDTH then
    -- is between y axis
    if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 2 <= pipe.y + PIPE_HEIGHT then
        return true
    end
  end

return false

end

function Bird:render()

  love.graphics.draw(
    self.image,
    self.x, self.y
  )

end 