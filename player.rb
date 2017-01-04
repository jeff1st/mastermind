class Player
  attr_reader :name
  attr_accessor :score, :computer_score

  def initialize(name)
    @name = name
    @score = 0
    puts "\n"
    puts "Hello #{@name}"
  end
end
