module Ai
  def makeRandomChoice
    choice = rand(6)
  end

  def checkIfPlaced(compare_list, guess_list, new_guess, mispl)
    (0...4).each do |i|
      color = guess_list[i]
      if compare_list[i] == "o"
        new_guess[i] = color
      elsif compare_list[i] == "x"
        mispl << [color, i]
        new_guess[i] = 0
      else
        new_guess[i] = 0
      end
    end
    return new_guess, mispl
  end

  def checkIfMisplaced(compare_list, guess_list, new_guess, mispl)
    if mispl[0] != nil
      mispl.each do |tuple|
        i = 0
        pass = false
        while i != 4 && pass == false
          if new_guess[i] == 0 && i != tuple[1]
            new_guess[i] = tuple[0]
            pass = true
          end
          i += 1
        end
      end
    end
    return new_guess
  end
  
  def makeLastChoices(guess_list, new_guess)
    (0...4).each do |i|
      if new_guess[i] == 0
        pass = false
        while pass == false
          new_guess[i] = @color_list[makeRandomChoice]
          pass = true if new_guess[i] != guess_list[i]
        end
      end
    end
    return new_guess
  end

  def makeMoreCleverChoice(compare_list, guess_list)
    mispl = []  
    new_guess = []
    
    new_guess, mispl = checkIfPlaced(compare_list, guess_list, new_guess, mispl)

    new_gess = checkIfMisplaced(compare_list, guess_list, new_guess, mispl)

    new_guess = makeLastChoices(guess_list, new_guess)

    return new_guess
  end
end

