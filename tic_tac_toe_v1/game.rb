require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(mark1, mark2)
        @player1 = HumanPlayer.new(mark1)
        @player2 = HumanPlayer.new(mark2)
        @board = Board.new()
        @currentplayer = @player1
    end

    def switch_turn
        if @currentplayer == @player1
            @currentplayer = @player2
        else
            @currentplayer = @player1
        end
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