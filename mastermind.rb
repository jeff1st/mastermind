class Board
  attr_reader :secret

  def initialize
    @secret = {:first=>"", :second=>"", :third=>"", :fourth=>""}
    @color_list = ["blue", "green", "red", "yellow", "orange", "purple"]
    @guess = [" ", " ", " ", " "]
    @check = [[" ", " "], [" ", " "]]
    @counter = 12
    fillSecret
  end

  def fillSecret
    @secret.keys.each { |key| @secret[key] = @color_list[rand(6)] }
  end

  def repr
    puts "\n"
    puts "#{@guess[0]} #{@guess[1]} #{@guess[2]} #{@guess[3]}".center(100)
    puts "\n"
    @check.each { |i| puts "|#{i[0]} #{i[1]}|".center(100) }
  end
end

