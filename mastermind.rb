require './player'
require './rules'

class Board
  include Game_rules

  attr_reader :secret, :human, :counter

  def initialize
    @secret = [" ", " ", " ", " "]
    @color_list = ["blue", "green", "red", "yellow", "orange", "purple"]
    @guess = [" ", " ", " ", " "]
    @counter = 12
    fillSecret
    createPlayer
    mainLoop
  end

  def fillSecret
    (0...4).each { |index| @secret[index] = @color_list[rand(6)] }
  end

  def repr
    c = compareGuess(@guess, @secret)
    puts "\n"
    puts "your guesses are: "
    puts "\t\t #{@guess[0]} \t | #{@guess[1]} \t | #{@guess[2]} \t | #{@guess[3]} \t\t results: |#{c[0]} #{c[1]} #{c[2]} #{c[3]}|"
    good = c.count("o")
    mispl = c.count("x")
    puts "\n"
    puts "\t\t Your results are #{good} placed and #{mispl} misplaced"
    puts "\n"
    puts "\n"
  end

  def createPlayer
    puts "\n"
    puts "What is your name please?"
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
      
      repr

      @counter -= 1
    end
  end

  def presentChoices
    validate = false
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

