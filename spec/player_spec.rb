require_relative '../player'

describe 'player' do
  before do
    @player1 = Player.new("playerTest")
  end

  it 'Creates an instance of Player' do
    expect(@player1).to be_instance_of(Player)
  end

  it 'Creates a player with his name and score' do
    expect(@player1.name).to eq "playerTest"
    expect(@player1.score).to eq 0
  end
end
