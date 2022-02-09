require_relative "code"

class Mastermind
    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(code)
        p @secret_code.num_exact_matches(code)
        p @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        p "Enter a code"
        response = gets.chomp
        code = Code.from_string(response)
        print_matches(code)
        @secret_code == code
    end
end
