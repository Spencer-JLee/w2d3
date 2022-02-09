class Player
    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        response = gets.chomp
        arr = []

        response.each_char.with_index do |char, i|
            arr.push(char.to_i) if "1234567890".include?(char.to_s)
        end

        arr
    end
end
