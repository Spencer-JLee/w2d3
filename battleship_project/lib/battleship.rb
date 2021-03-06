require_relative "board"
require_relative "player"

class Battleship
    def initialize(num)
        @player = Player.new()
        @board = Board.new(num)
        @remaining_misses = @board.size / 2
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose'
            return true
        end
        return false
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        end
        return false
    end

    def game_over?
        if self.win? || self.lose?
            return true
        else
            return false
        end
    end

    def turn
        move = @player.get_move
        attack = @board.attack(move)
        if !attack
            @remaining_misses -= 1
        end
        @board.print
        p @remaining_misses
    end
end
