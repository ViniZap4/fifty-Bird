
-- create a baseState, base class for all states
BaseState = Class{}

function BaseState:init() end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end

-- create a StateMachine
StateMachine = Class{}


function StateMachine:init(states)

  -- set states table
  self.states = states or {}
  self.current = BaseState

end

function StateMachine:change(nameState, enterParams)
  
  -- change state
  assert(self.states[nameState])
  self.current:exit()
  self.current = self.states[nameState]()
  self.current:enter(enterParams)

end

function StateMachine:update(dt)
  self.current:update(dt)
end

function StateMachine:render()
  self.current:render()
end

function createState()
 return Class{__includes = BaseState}
end

-- set sate machine with functions
gameState = StateMachine {
  ['title'] = function() return TitleScreenState() end,
  ['countdown'] = function() return CountdownState() end,
  ['play'] = function() return PlayState() end,
  ['score'] = function() return ScoreState() end
}