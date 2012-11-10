require 'rubygems'
require 'gosu'

require_relative 'engine'
require_relative 'zorder'

require_relative 'alien'
require_relative 'bullet'
require_relative 'energy_bar'
require_relative 'explosion'
require_relative 'hud'
require_relative 'ship'


game = Engine::Game.instance
game.show
