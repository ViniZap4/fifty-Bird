-- import libs

-- https://github.com/vrld/hump/blob/master/class.lua
Class = require "libs/class"

-- https://github.com/Ulydev/push
push = require "libs/push"

-- import components
require 'components/font'
require 'components/audio'
require "components/images"
require "components/input"

-- import state machine 
require 'components/StateMachine'

-- import states

require 'states/CountdownState'
require 'states/PlayState'
require 'states/ScoreState'
require 'states/TitleScreenState'

-- import classes
require "classes/bird"
require "classes/pipe"
require "classes/PipePair"