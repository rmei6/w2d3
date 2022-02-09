require_relative "board"
require_relative "human_player"
class Game

    def initialize(n,*marks)
        return false if marks.empty?
        @board = Board.new(n)
        @players = []
        marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos,@current_player.mark)
            if @board.win?(@current_player.mark)
                p "VICTORY!!! Player With Mark '" + @current_player.mark.to_s + "' Wins!!!"
                return true
            else
                switch_turn
            end
        end
        p "DRAW"
        return true
    end
end