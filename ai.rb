module Ai
  def makeChoice(color_list)
    counter = 4
    guess_list = [" ", " ", " ", " "]
    while counter != 0
      guess_list << color_list[rand(6)]
      counter -= 1
    end
    return guess_list
  end

  def makeChoiceWithConstraint

  end
end

