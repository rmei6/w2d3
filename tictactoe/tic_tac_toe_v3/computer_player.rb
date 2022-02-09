class ComputerPlayer

    attr_reader :mark ,:spec

    def initialize(mark)
        @mark = mark
        @spec = "Computer"
    end

    def get_position(legal)
        pos = legal.sample
        puts "Computer " + @mark.to_s + " chose position " + pos.to_s
        pos
    end

end