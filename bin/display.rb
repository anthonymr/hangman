class Display
  class << self
    def show(chances, guesses, word)
      system('cls') || system('clear')
      display_chances(chances)
      display_guesses(guesses)
      display_word(word, guesses)
      display_hangman(chances)
    end

    def display_chances(chances)
      puts "You have #{chances} chances left."
    end

    def display_guesses(guesses)
      puts "You have guessed: #{guesses.join(', ')}"
    end

    def display_word(word, guesses)
      puts
      puts word.chars.map { |c| guesses.include?(c) ? " #{c} " : ' _ ' }.join
    end

    def display_hangman(chances)
      puts '  _______'
      puts ' |       |'
      puts " |       #{chances < 7 ? 'O' : ''}"
      puts " |      #{chances < 6 ? '/' : ''}#{chances < 5 ? '|' : ''}#{chances < 4 ? '\\' : ''}"
      puts " |      #{chances < 3 ? '/' : ''} #{chances < 2 ? '\\' : ''}"
      puts ' |'
      puts '_|_'
    end

    def final(win, word)
      system('cls') || system('clear')
      puts win ? 'You win!' : "You lose!, the word was '#{word}'"
    end
  end
end
