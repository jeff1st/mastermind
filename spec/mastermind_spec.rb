require_relative '../mastermind'

describe 'board' do
  it 'Creates a new secret hash with a length of 4' do
    game = Board.new
    expect(game.secret.length).to eq 4
    expect(game.secret).to be_a(Hash)
  end
end

describe 'board' do
  it 'Pairs each part of the secret with a color from a list' do
    game = Board.new
    color_list = ["blue", "green", "red", "yellow", "orange", "purple"]
    game.secret.values.each { |color| expect(color_list).to include(color) }
  end
end
