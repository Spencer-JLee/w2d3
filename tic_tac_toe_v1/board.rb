class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(arr)
        (arr[0] >= 0 && arr[0] <= 2) && (arr[1] >= 0 && arr[1] <= 2)
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
        (0..@grid.length).each do |i|
            return true if @grid[1][i] == mark && @grid[0][i] == mark && @grid[2][i] == mark
        end

        false
    end

    def win_diagonal?(mark)
        if @grid[1][1] == mark
            return true if (@grid[0][0] == mark && @grid[2][2] == mark) || (@grid[2][0] == mark && @grid[0][2] == mark)
        end

        false
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