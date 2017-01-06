require './player'
require './rules'
require './ai'

class Board
  include Game_rules
  include Ai

  attr_reader :secret, :counter, :human

  def initialize
    @secret = [" ", " ", " ", " "]
    @color_list = ["blue", "green", "red", "yellow", "orange", "purple"]
    @guess = [" ", " ", " ", " "]
    @counter = 12
    @computer_score = 0
    createPlayer
    start
  end

  def createPlayer
    puts "\n"
    puts "What is your name please?"
    name = gets.chomp
    @human = Player.new(name)
  end

  def start
    pass = false
    puts "\n"
    puts "play as coder/decoder? (c/d)"
    while pass == false
      answer = gets.chomp
      answer == "c" || answer == "d" ? (pass = true) : (puts "please choose c or d")
    end

    answer == "c" ? (startComputer) : (startHuman)
  end

  def startHuman
    fillSecret
    mainLoop
  end

  def startComputer
    makeSecret
    mainLoopForComp
  end

#Human part

  def fillSecret
    (0...4).each { |index| @secret[index] = @color_list[rand(6)] }
  end

  def mainLoop
    while @counter != 0
      puts "\n"
      puts "Please #{@human.name}, make your guess (#{13 - @counter} on 12)"
      (0...4).each do |i|
        puts "\n"
        puts "#{i+1} place?"
        @guess[i] = presentChoices
      end
      
      repr

      @counter -= 1
    end

    @computer_score += 1
    talkToPlayer("loose")
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

    (@human.score += 1; talkToPlayer("win")) if good == 4
  end

#Computer part

  def makeSecret
    puts "Please #{@human.name}, create the secret!"
    puts "\n"
    (0...4).each do |time|
      pass = false
      puts "Select on color from the following choices... "
      @color_list.each_with_index { |color, index| puts "#{index}: #{color}" }
      while pass == false
        choice = gets.chomp
        puts "\n"
        choice =~ /^[0-5]{1}$/ ? (pass = true) : (puts "Please, give a number between 0 and 5")
      end

      @secret[time] = @color_list[choice.to_i]
    end
    puts @secret
  end

  def mainLoopForComp
    @guess = []
    puts "\n"
    puts "Computer is making a choice"
    puts "Guess #{13 - @counter} on 12"
    (0...4).each do |i|
      @guess << @color_list[makeRandomChoice]
    end
      
    res = reprForComp
    pass = false

    while pass == false
      puts "Press 'c' to continue"
      input = gets.chomp
      pass = true if input == "c"
    end
      
    @counter -= 1

    while @counter != 0
      puts "\n"
      puts "Computer is making a choice"
      puts "Guess #{13 - @counter} on 12"
      @guess = makeMoreCleverChoice(res, @guess)

      res = reprForComp

      pass = false

      while pass == false
        puts "Press 'c' to continue"
        input = gets.chomp
        pass = true if input == "c"
      end

      @counter -= 1

    end
    @human.score += 1
    talkToComputer("loose")
  end

  def reprForComp
    c = compareGuess(@guess, @secret)
    puts "\n"
    puts "Computer guesses are: "
    puts "\t\t #{@guess[0]} \t | #{@guess[1]} \t | #{@guess[2]} \t | #{@guess[3]} \t\t results: |#{c[0]} #{c[1]} #{c[2]} #{c[3]}|"
    good = c.count("o")
    mispl = c.count("x")
    puts "\n"
    puts "\t\t Computer results are #{good} placed and #{mispl} misplaced"
    puts "\n"
    puts "\n"
    
    (@computer_score += 1; talkToComputer("win")) if good == 4
    return c
  end
 
#Other

  def presentChoices
    pass = false
    puts "1- blue, 2- green, 3- red, 4- yellow, 5- orange, 6- purple"
    puts "\n" 
    while pass == false
      answer = gets.chomp
      answer =~ /^[1-6]{1}$/ ? (pass = true) : (puts "Please, give a number between 1 and 6!")
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

  def talkToPlayer(status)
    status == "win" ? (puts "You win"; endGame) : (puts "You loose"; endGame)
  end

  def talkToComputer(status)
    status == "win" ? (puts "Computer win"; endGame) : (puts "Computer loose"; endGame)
  end

  def endGame
    pass = false
    puts "Scores are:"
    puts "#{@human.name}: #{@human.score} - Computer: #{@computer_score}"
    puts "\n"
    puts "Game is over now!"
    puts "Do you want to play another round? (y/n)"
    puts "\n"

    while pass == false
      answer = gets.chomp
      answer == "y" || answer == "n" ? (pass = true) : (puts "Not a correct choice!, please try again (y or n)")
    end

    answer == "y" ? (puts "OK #{@human.name}, let's play again"; reset) : (puts "OK, bye #{@human.name}, then"; exit(0))
  end

  def reset
    @counter = 12
    @secret = [" ", " ", " ", " "]
    @guess = [" ", " ", " ", " "]
    start
  end
end

game = Board.new()
