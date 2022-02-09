require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    def initialize(num, hash)
        @players = []
        @board = Board.new(num)
        hash.each do |k, v|
            if v
                @players.push(ComputerPlayer.new(k))
            else
                @players.push(HumanPlayer.new(k))
            end
        end
        @currentplayer = @players[0]
    end

    def switch_turn
        @players.rotate!
        @currentplayer = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            positions = @board.legal_positions
            arr = @currentplayer.get_position(positions)
            @board.place_mark(arr, @currentplayer.mark)
            if @board.win?(@currentplayer.mark)
                return "Victory! Player " + @currentplayer.mark.to_s + " won."
            else
                self.switch_turn
            end
        end

        return "Draw"
    end
end