require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(num, *marks)
        @players = []
        @board = Board.new(num)
        marks.each do |mark|
            @players.push(HumanPlayer.new(mark))
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
            arr = @currentplayer.get_position
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