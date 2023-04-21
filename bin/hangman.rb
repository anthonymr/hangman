require_relative 'game'
require_relative 'arguments'

def main
  game = Game.new(Arguments.parse[:difficulty])
  game.play
rescue Interrupt
  system('cls') || system('clear')
end

main
