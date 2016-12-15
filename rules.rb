module Game_rules
  def compareGuess(guess, secret)
    counter = Hash.new(0)
    secret.each { |item| counter[item] += 1 }
    results = [" ", " ", " ", " "]

    (0...4).each do |good_place|
      item_to_test = guess[good_place]
      if item_to_test == secret[good_place]
        results[good_place] = "o"
        counter[item_to_test] -= 1
      end
    end

    (0...4).each do |place|
      if !secret.include?(guess[place])
        results[place] = "."
      else
        if results[place] != "o"
          item_to_test = guess[place]
          counter[item_to_test] < 1 ? (results[place] = ".") : (results[place] = "x")
          counter[item_to_test] -= 1
        end
      end
    end
    return results
  end
end
