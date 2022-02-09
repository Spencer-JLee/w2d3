class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position
        p "Enter a row and column position"
        response = gets.chomp
        arr = []

        response.each_char.with_index do |char, i|
            arr.push(char.to_i) if "0123456789".include?(char)
        end

        arr
    end
end