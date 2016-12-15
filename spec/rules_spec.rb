require_relative '../rules'

describe '#compareGuess' do
  it "Must return one 'o' for each good guess" do
    secret = ["1", "2", "3", "4"]
    guess1 = ["1", "5", "6", "7"]
    guess2 = ["1", "2", "5", "6"]
    guess3 = ["1", "2", "5", "4"]
    extend Game_rules
    expect(compareGuess(guess1, secret)).to eq ["o", ".", ".", "."]
    expect(compareGuess(guess2, secret)).to eq ["o", "o", ".", "."]
    expect(compareGuess(guess3, secret)).to eq ["o", "o", ".", "o"]
  end
end

describe '#compareGuess' do
  it "Must return one 'x' for each misplaced but good guess" do
    secret = ["1", "2", "3", "4"]
    guess1 = ["0", "1", "6", "7"]
    guess2 = ["0", "1", "2", "6"]
    guess3 = ["0", "1", "4", "2"]
    extend Game_rules
    expect(compareGuess(guess1, secret)).to eq [".", "x", ".", "."]
    expect(compareGuess(guess2, secret)).to eq [".", "x", "x", "."]
    expect(compareGuess(guess3, secret)).to eq [".", "x", "x", "x"]
  end
end

describe '#compareGuess' do
  it "Must return one 'o' for each good guess, 'x' for each good but misplaced guess" do
    secret = ["1", "2", "3", "4"]
    guess1 = ["1", "1", "6", "7"]
    guess2 = ["1", "2", "1", "2"]
    guess3 = ["1", "3", "4", "4"]
    extend Game_rules
    expect(compareGuess(guess1, secret)).to eq ["o", ".", ".", "."]
    expect(compareGuess(guess2, secret)).to eq ["o", "o", ".", "."]
    expect(compareGuess(guess3, secret)).to eq ["o", "x", ".", "o"]
  end
end

