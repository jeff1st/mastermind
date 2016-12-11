require './player'

class Board
  attr_reader :secret, :human, :counter

  def initialize
    @secret = {:first=>"", :second=>"", :third=>"", :fourth=>""}
    @color_list = ["blue", "green", "red", "yellow", "orange", "purple"]
    @guess = [" ", " ", " ", " "]
    @check = [[" ", " "], [" ", " "]]
    @compare = []
    @counter = 12
    fillSecret
    createPlayer
    mainLoop
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

  def createPlayer
    puts "\n"
    puts "What is your name please?"
    puts "\n"
    name = gets.chomp
    @human = Player.new(name)
  end

  def mainLoop
    while @counter != 0
      puts "\n"
      puts "Please make your guess (#{13 - @counter} on 12)"
      (0...4).each do |i|
        puts "\n"
        puts "#{i+1} place?"
        @guess[i] = presentChoices
      end
      
      puts "\n"
      puts "your guesses are: "
      puts "#{@guess[0]} | #{@guess[1]} | #{@guess[2]} | #{@guess[3]}"

      @counter -= 1
    end
  end

  def presentChoices
    validate = false
    puts "\n"
    puts "1- blue, 2- green, 3- red, 4- yellow, 5- orange, 6- purple"
    puts "\n" 
    while validate == false
      answer = gets.chomp
      answer =~ /^[1-6]{1}$/ ? (validate = true) : (puts "Please, give a number between 1 and 6!")
    end

    case answer
    when "1"
      return "blue"
    when "2"
      return "green"
    when "3"
      return "red"
    when "4"
      return "yellow"
    when "5"
      return "orange"
    else
      return "purple"
    end
  end
end

