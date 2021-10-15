CountdownState  = createState()

COUNTDOWN_TIME = 0.75

function CountdownState:init()
	self.count = 3  
	self.timer  = 0
end

function CountdownState:update(dt)
	self.timer = self.timer +  dt

	if self.timer > COUNTDOWN_TIME then

		self.timer = self.timer % COUNTDOWN_TIME
		self.count = self.count -1
		
		if self.count == 0 then
			gameState:change("play")
		end
	end

end

function CountdownState:render()

	Font:printf(
		tostring(self.count),
		0, 120, -- x and y
		hugeFont
	)

end