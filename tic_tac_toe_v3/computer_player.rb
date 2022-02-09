class ComputerPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        p "Computer " + mark.to_s + " chose position " + legal_positions[rand(legal_positions.length)].to_s
        legal_positions[rand(legal_positions.length)]
    end
end