module Ai
  def makeRandomChoice
    choice = rand(6)
  end

  def makeMoreCleverChoice(compare_list, guess_list)
    mispl = []
    
    new_guess = []
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

    if mispl[0] != nil
      mispl.each do |tuple|
        i = 0
        validate = false
        while i != 4 && validate == false
          if new_guess[i] == 0 && i != tuple[1]
            new_guess[i] = tuple[0]
            validate = true
          end
          i += 1
        end
      end
    end

    (0...4).each do |i|
      if new_guess[i] == 0
        new_guess[i] = @color_list[makeRandomChoice]
      end
    end

  return new_guess
  end
end

