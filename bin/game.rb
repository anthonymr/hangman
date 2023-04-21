require_relative 'words'
require_relative 'display'

class Game
  def initialize(dificulty)
    @current_word = Words.get_new_word(dificulty || 0) # 1 - 7, 0 = random
    @current_guess = ''

    @chances = 7
    @guesses = []

    @game_over = false
    @win = false
  end

  def play
    until @game_over
      Display.show(@chances, @guesses, @current_word)
      ask_guess
      check_guess
    end
    Display.final(@win, @current_word)
  end

  def ask_guess
    puts 'Guess a letter or the whole word'
    @current_guess = gets.chomp
  end

  def check_guess
    if @current_guess.length == 1
      check_letter
    else
      check_word
    end
  end

  def check_letter
    return if @guesses.include?(@current_guess)

    @guesses << @current_guess

    @chances -= 1 unless @current_word.include?(@current_guess)

    check_game_over
  end

  def check_word
    if @current_word == @current_guess
      @win = true
      @game_over = true
    else
      @chances -= 1
      check_game_over
    end
  end

  def check_game_over
    @win = true if @current_word.chars.all? { |c| @guesses.include?(c) }

    @game_over = true if @chances < 1 || @win
  end
end
