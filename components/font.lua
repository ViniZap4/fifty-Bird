Font = {}

function Font:new(path, size) 
  return love.graphics.newFont("font/" .. path, size)
end

function Font:set(namefont) 
  love.graphics.setFont(namefont)
end


-- import fonts

flappyFont = Font:new("flappy.ttf", 28)
-- differents sizes
smallFont = Font:new('font.ttf', 8)
mediumFont = Font:new('flappy.ttf', 14)
hugeFont = Font:new('flappy.ttf', 56)

return {
  flappyFont,
  smallFont,
  mediumFont,
  hugeFont
}