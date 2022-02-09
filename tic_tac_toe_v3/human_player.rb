class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        p "Enter a row and column position, Player " + @mark.to_s
        response = gets.chomp
        arr = []

        response.each_char.with_index do |char, i|
            arr.push(char.to_i) if "0123456789".include?(char)
        end

        if !legal_positions.include?(arr)
            p "Your choice was illegal"
            self.get_position(legal_positions)
        else
            arr
        end
    end
end