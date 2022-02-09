require_relative "board"
require_relative "human_player"
class Game

    def initialize(player1_mark,player2_mark)
        @board = Board.new
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2 
        else
            @current_player = @player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos,@current_player.mark)
            if @board.win?(@current_player.mark)
                if @current_player == @player1
                    p "VICTORY!!! Player 1 Wins!!!"
                else
                    p "VICTORY!!! Player 2 Wins!!!"
                end
                return true
            else
                switch_turn
            end
        end
        p "DRAW"
        return true
    end

end