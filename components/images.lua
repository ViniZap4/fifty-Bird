Img = {}

function Img:new(path)
  return love.graphics.newImage("images/" .. path)
end