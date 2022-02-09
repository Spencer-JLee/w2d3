class Board
    def initialize(num)
        @grid = Array.new(num) {Array.new(num, "_")}
    end

    def valid?(arr)
        (arr[0] >= 0 && arr[0] < @grid.length) && (arr[1] >= 0 && arr[1] < @grid[0].length)
    end

    def empty?(arr)
        @grid[arr[0]][arr[1]] == "_"
    end

    def place_mark(arr, mark)
        if valid?(arr) && empty?(arr)
            @grid[arr[0]][arr[1]] = mark
        else 
            raise
        end
    end

    def print
        @grid.each do |n|
            p n.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |n|
            return true if n.all?{ |m| m == mark}
        end

        false
    end

    def win_col?(mark)
        new_grid = @grid.transpose

        new_grid.each do |n|
            return true if n.all?{|m| m == mark}
        end

        false
    end

    def win_diagonal?(mark)
        left = 0
        right = 0 

        @grid.each_with_index do |n, i|
            left += 1 if @grid[i][i] == mark
            right += 1 if @grid[i][-1 - i] == mark
        end

        left == @grid.length || right == @grid.length
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each_with_index do |n, i|
            @grid[0].each_with_index do |m, j|
                return true if empty?([i, j])
            end
        end
        
        false
    end
end