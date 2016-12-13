module Game_rules
  def compareGuess(guess, secret)
    temp_list = [" ", " ", " ", " "]
    (0...guess.length).each do |index|
      if secret[index] == guess[index]
        temp_list[index] = "o"
      elsif secret.include?(guess[index])
        temp_list[index] = "x"
      else
        temp_list[index] = "."
      end
    end
    return temp_list
  end
end
