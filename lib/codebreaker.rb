#require 'codebreaker/version'
#require 'codebreaker/game'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)


require 'codebreaker/game'

game = Codebreaker::Game.new(STDOUT)
game.start
#module Codebreaker
  # Your code goes here..
#game = Game.new
#game.start
#end
