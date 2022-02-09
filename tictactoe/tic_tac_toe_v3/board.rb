class Board
    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n) {Array.new(n,"_")}
    end

    def valid?(pos)
        (0...@grid.length).include?(pos[0]) && (0...@grid.length).include?(pos[1]) && @grid[pos[0]][pos[1]] == "_"
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
            return true if array.count(mark) == @grid.length
        end
        false
    end

    def win_col?(mark)
        trans = @grid.transpose
        trans.each do |array|
            return true if array.count(mark) == @grid.length
        end
        false
    end

    def win_diagonal?(mark)
        diag1 = []
        diag2 = []
        (0...@grid.length).each do |i|
            diag1 << @grid[i][i]
            diag2 << @grid[i][-(i+1)]
        end
        diag1.count(mark) == @grid.length || diag2.count(mark) == @grid.length
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end

    def legal_positions
        legal = []
        @grid.each_with_index do |array,i|
            array.each_with_index do |sym,j|
                legal << [i,j] if @grid[i][j] == "_"
            end
        end
        legal
    end
end

