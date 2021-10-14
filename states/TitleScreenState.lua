TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
	-- void
end

function TitleScreenState:update(dt)
	if love.keyboard.isDown("kpenter") or love.keyboard.isDown("return") then
		gameState:change('countdown')
	end
end

function TitleScreenState:render()

	Font:printf(
		"Fifty Bird"
		,0, 64, -- x and y
		flappyFont
	)
	
	Font:printf(
		"Aperte Enter para continuar",
		0, 100,  -- x, y
		mediumFont
	)


end