class Board

    def self.print_grid(twod)
        twod.each do |array|
            puts array.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n*n
    end

    def size
        @size   #should use size or self.size as good syntax
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos,value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        @grid.inject(0) {|acc,array| acc += array.count(:S)}
    end

    def attack(pos)
        if self.[](pos) == :S
            self.[]=(pos,:H)
            puts "you sunk my battleship!"
            return true
        else
            self.[]=(pos,:X)
            return false
        end
    end

    def place_random_ships
        count = (@size * 0.25)
        len = @grid.length
        while count > self.num_ships
            row = rand(0...len)
            column = rand(0...len)
            pos = [row,column]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map {|arr| arr.map {|el| 
            if el == :S
                el = :N 
            else
                el
            end
            }
        }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
