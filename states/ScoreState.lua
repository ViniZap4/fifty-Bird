ScoreState = createState()

function ScoreState:enter(params)
  self.score = params.score
end

function ScoreState:update()

  -- go back to play if enter is pressed
  if love.keyboard.isDown("kpenter") or love.keyboard.isDown("return") then
    gameState:change('countdown')
  end

end

function ScoreState:render()
  Font:printf(
    "oh, voce morreu!",
    0, 64,
    flappyFont
  )
  Font:printf(
    "seu Score e: " .. tostring(self.score) ,
    0, 100,
    mediumFont
  )
  Font:printf(
    "Aperte enter para jogar novamente ",
    0, 160,
    mediumFont
  )
end