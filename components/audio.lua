Audio = {}

function Audio:new(path, type) 
  return love.audio.newSource("sounds/" .. path, type)
end



-- import songs
sounds = {
  ["jump"] = Audio:new("jump.wav", "static"),
  ['explosion'] = Audio:new('explosion.wav', 'static'),
  ['hurt'] = Audio:new('hurt.wav', 'static'),
  ['score'] = Audio:new('score.wav', 'static'),
  
  -- loop music song | https://freesound.org/people/xsgianni/sounds/388079/
  ['music'] = Audio:new('marios_way.mp3', 'static') 
  
}

return sounds