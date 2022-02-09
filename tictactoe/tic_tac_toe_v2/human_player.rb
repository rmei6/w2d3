class HumanPlayer

    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Please enter a position like '4 7' with one space between the two numbers: "
        input = gets.chomp.split(" ")
        raise "invalid response" if input.length > 2 || input.any? {|el| el.split("").any? {|char| !('0'..'9').include?(char.downcase)}}
        input.map {|el| el.to_i}
    end
end