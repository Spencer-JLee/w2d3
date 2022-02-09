class Board
    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
    end

    def size
        @size
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(arr, num)
        @grid[arr[0]][arr[1]] = num
    end

    def num_ships
        sum = 0

        @grid.each do |n|
            sum += n.count{ |m| m == :S}
        end

        sum
    end

    def attack(arr)
        if self[arr] == :S
            self[arr] = :H
            p "You sunk my battleship"
            return true
        else 
            self[arr] = :X
            return false
        end
    end

    def place_random_ships
        ships = (@size * 0.25).to_i
        i = 0

        while i < ships
            x = rand(Math.sqrt(@size))
            y = rand(Math.sqrt(@size))
            arr = [x, y]
            if self[arr] == :N 
                self[arr] = :S
                i += 1
            end
        end

    end

    def hidden_ships_grid
        hidden_grid = Array.new(Math.sqrt(@size)) {Array.new(Math.sqrt(@size))}

        @grid.each_with_index do |n, i|
            n.each_with_index do |m, j|
                arr = [i, j]
                if self[arr] == :S 
                    hidden_grid[i][j] = :N
                else
                    hidden_grid[i][j] = m
                end
            end
        end

        hidden_grid
    end

    def self.print_grid(arr)
        arr.each do |n|
            p n.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
                
end
