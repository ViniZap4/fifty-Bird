Img = {}

function Img:new(path)
  return love.graphics.newImage("images/" .. path)
end

function Img:getW(img)
  return img.image:getWidth()
end

function Img:getH(img)
  return img.image:getHeight()
end