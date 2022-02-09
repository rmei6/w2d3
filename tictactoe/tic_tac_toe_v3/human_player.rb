class HumanPlayer

    attr_reader :mark ,:spec
    
    def initialize(mark)
        @mark = mark
        @spec = "Player"
    end

    def get_position(legal)
        input = []
        loop do
            puts "Player " + @mark.to_s + ", enter two numbers representing a position in the format `row col`"
            input = gets.chomp.split(" ")
            raise "invalid response" if input.length > 2 || input.any? {|el| el.split("").any? {|char| !('0'..'9').include?(char.downcase)}}
            input.map! {|el| el.to_i}
            if legal.include?(input) 
                break 
            else
                puts input.to_s + " is not a legal position"
            end
        end
        input
    end
end