require_relative '../player'

describe 'player' do
  it 'Creates a player with his name ans score' do
    play1 = Player.new("playerTest")
    expect(play1.name).to eq "playerTest"
    expect(play1.score).to eq 0
  end
end
