#require_relative 'codebreaker/version'

module Codebreaker
class Game
    @@coutn = 1
    def initialize(output = STDOUT)
      @output = output
    end
    
    def start
      @secret = generate_code
      @output.puts "Welcome to Codebreaker! \n To see the hint press h and ENTER \n To exit press q and ENTER"
      prompt
    end
    
    def prompt
      @output.puts "Enter guess:"
      #answer = gets.chomp
      while @@coutn < 30 do
        answer = gets.chomp
        case answer
          when 'h'
            hint
          when 'q'
            exit
          when 'y'
            guess(answer)
            @@coutn = 0
            else
            guess(answer)
          end
        @@coutn += 1
      end

    end

    def end_of_game
      @output.puts "The secret code was: #{@secret}, you loos!\n To play again type y and ENTER to quit type q & ENTER"
      @secret = generate_code
    end

    def hint
      @output.puts "The first number is: #{@secret}"
    end

    def guess(guess)
      marker = Marker.new(@secret, guess)
      if marker.exact_match_count != 4
        @output.puts "Guess number #{@@coutn} \n" + '+'*marker.exact_match_count + '-'*marker.number_match_count
      else
        @output.puts "Type your name:"
        @secret = generate_code
        writename
      end
    end

    def writename
      answer = gets.chomp
      @output.puts "Sencks for the game #{answer}, you win by #{@@coutn} guesses\n To play again type y and ENTER to quit type q & ENTER "
      #somethig to output, then guess again... chenge the win mess
    end
    private
    def generate_code
      @code = Array('1'..'6').sample(4).join
    end
  end

  class Marker
    def initialize(secret, guess)
      @secret, @guess = secret, guess
    end
    
    def number_match_count
      total_match_count - exact_match_count
    end
    
    def total_match_count
      secret = @secret.split('')
      @guess.split('').inject(0) do |count, n|
      count + (delete_first(secret, n) ? 1 : 0)
      end
    end
    def delete_first(code, n)
      code.delete_at(code.index(n)) if code.index(n)
    end
    def exact_match_count
      (0..3).inject(0) do |count, index|
      count + (exact_match?(@guess, index) ? 1 : 0)
      end
    end
    
    def exact_match?(guess, index)
      @guess[index] == @secret[index]
    end
    
    def number_match?(guess, index)
      @secret.include?(@guess[index]) && !exact_match?(@guess, index)
    end
end
end
#Codebreaker::Game.new.start
