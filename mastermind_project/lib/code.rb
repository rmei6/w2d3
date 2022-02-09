class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all?{|char| POSSIBLE_PEGS.key?(char.upcase)}
  end

  def self.random(length)
    new_p = []
    length.times do new_p << POSSIBLE_PEGS.keys.sample end
    Code.new(new_p)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end
  
  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs
      @pegs.map! {|char| char.upcase}
    else
      raise "invalid pegs"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |char,i| count += 1 if char == @pegs[i] end
    count
  end

  def num_near_matches(guess)   
    #count = 0   #walkthrough solution doesn't work. rethink logic
    #guess.pegs.each_with_index do |char,i|
    #  if char != self[i] && @pegs.include?(char)
    #    count += 1
    #  end
    #end
    #count

    count = 0
    indices = (0...guess.length).to_a
    char_count = Hash.new(0)
    @pegs.each do |char| char_count[char] += 1 end
    guess.pegs.each_with_index do |char,i|
      if char == self[i] 
        indices.delete(i)
        char_count[char] -= 1
      end
    end
    indices.each do |i|
      if @pegs.include?(guess[i]) && char_count[guess[i]] > 0
        count += 1
        char_count[guess[i]] -= 1
      end
    end
    count

  end

  def ==(guess)
    return false if guess.length != self.length
    (0...guess.length).each do |i| return false if guess[i] != self[i] end
    true
  end
end
