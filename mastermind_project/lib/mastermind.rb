require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(another_code)
        puts "Exact Matches: " + @secret_code.num_exact_matches(another_code).to_s
        puts "Near Matches: " + @secret_code.num_near_matches(another_code).to_s
    end

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        guess = Code.from_string(input)
        print_matches(guess)
        guess == @secret_code
    end
end
