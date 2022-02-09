require_relative "board"
require_relative "player"

class Battleship

    #attr_reader :board , :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size * 0.5
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        puts "Number of ships: " + @board.num_ships.to_s
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        return true if win? || lose?
        return false
    end

    def turn
        pos = @player.get_move
        @remaining_misses -= 1 if !@board.attack(pos)
        @board.print
        puts "Remaining Misses: " + @remaining_misses.to_s
    end
end
