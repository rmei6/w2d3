class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(3) {Array.new(3,"_")}
    end

    def valid?(pos)
        (0...3).include?(pos[0]) && (0...3).include?(pos[1]) && @grid[pos[0]][pos[1]] == "_"
    end

    def empty?(pos)
        row = pos[0]
        column = pos[1]
        @grid[row][column] == "_"
    end

    def place_mark(pos,mark)
        raise "position not valid/available"if !valid?(pos) || !empty?(pos)
        @grid[pos[0]][pos[1]] = mark
    end

    def print
        @grid.each do |array| p array end
    end

    def win_row?(mark)
        @grid.each do |array|
            return true if array.count(mark) == 3
        end
        false
    end

    def win_col?(mark)
        trans = @grid.transpose
        trans.each do |array|
            return true if array.count(mark) == 3
        end
        false
    end

    def win_diagonal?(mark)
        diag1 = []
        diag2 = []
        (0..2).each do |i|
            diag1 << @grid[i][i]
            diag2 << @grid[i][-(i+1)]
        end
        diag1.count(mark) == 3 || diag2.count(mark) == 3
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end
end

