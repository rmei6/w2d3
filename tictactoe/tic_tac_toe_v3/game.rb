require_relative "board"
require_relative "human_player"
require_relative "computer_player"
class Game

    def initialize(n,hash)
        return false if hash.empty?
        @board = Board.new(n)
        @players = []
        hash.each_pair do |mark,man_or_bot|
            if man_or_bot
                @players << ComputerPlayer.new(mark) 
            else
                @players << HumanPlayer.new(mark)
            end
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
            legal = @board.legal_positions
            pos = @current_player.get_position(legal)
            @board.place_mark(pos,@current_player.mark)
            if @board.win?(@current_player.mark)
                puts "VICTORY!!! " + @current_player.spec.to_s + " " + @current_player.mark.to_s + " Wins!!!"
                return true
            else
                switch_turn
            end
        end
        puts "DRAW"
        return true
    end
end