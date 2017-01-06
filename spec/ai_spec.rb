require_relative '../ai'

describe Ai do

  include Ai
  describe '.checkIfPlaced' do
    before do
      @compare_list1 = ["o", ".", "x", "x"]
      @compare_list2 = ["x", "o", "o", "."]
      @guess_list1 = ["yellow", "blue", "red", "green"]
      @guess_list2 = ["yellow", "blue", "blue", "red"]
      @new_guess = []
      @mispl = []
    end

    it 'good positions must return results' do
      expect(checkIfPlaced(@compare_list1, @guess_list1, @new_guess, @mispl)[0][0]).to eq("yellow")
      expect(checkIfPlaced(@compare_list2, @guess_list2, @new_guess, @mispl)[0][1]).to eq("blue")
      expect(checkIfPlaced(@compare_list2, @guess_list2, @new_guess, @mispl)[0][2]).to eq("blue")
    end

    it 'misplaced positions must return results' do
      @mispl = []
      expect(checkIfPlaced(@compare_list1, @guess_list1, @new_guess, @mispl)[1][0]).to eq(["red", 2])
      @mispl = []
      expect(checkIfPlaced(@compare_list1, @guess_list1, @new_guess, @mispl)[1][1]).to eq(["green", 3])
      @mispl = []
      expect(checkIfPlaced(@compare_list2, @guess_list2, @new_guess, @mispl)[1][0]).to eq(["yellow", 0])
    end
  end
  
  describe '.checkIfPlaced' do
    before do
      @new_guess1 = ["yellow", 0, "blue", 0]
      @new_guess2 = ["yellow", 0, "blue", 0]
      @new_guess3 = ["yellow", 0, 0, 0]
      @mispl1 = [["green", 1]]
      @mispl2 = [["green", 1], ["blue", 3]]
      @mispl3 = [["green", 1], ["blue", 3], ["red", 2]]
    end

    it 'misplaced positions must return results' do
      expect(checkIfMisplaced(@new_guess1, @mispl1)[3]).to eq("green")
      expect(checkIfMisplaced(@new_guess2, @mispl2)[1]).to eq("blue")
      expect(checkIfMisplaced(@new_guess2, @mispl2)[3]).to eq("green")
      expect(checkIfMisplaced(@new_guess2, @mispl2)[3]).to eq("green")
      expect(checkIfMisplaced(@new_guess3, @mispl3)[1]).to eq("blue").or eq("red")
      expect(checkIfMisplaced(@new_guess3, @mispl3)[2]).to eq("blue").or eq("green")
      expect(checkIfMisplaced(@new_guess3, @mispl3)[3]).to eq("green").or eq("red")
    end
  end

  describe '.makeLastChoices' do
    before do
      @color_list = ["yellow", "red", "green", "blue", "orange", "purple"]
      @guess_list = ["yellow", "red", "orange", "blue"]
      @new_guess = ["yellow", "orange", 0, "blue"]
    end

    it 'last method must fill the blanks' do
      expect(makeLastChoices(@guess_list, @new_guess)[2]).to be_a(String)
    end
  end
end
