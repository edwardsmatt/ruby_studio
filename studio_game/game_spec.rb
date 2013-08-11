require_relative 'game'

describe Game do
  before do
    $stdout = StringIO.new
    @game = Game.new("knuckleheads")
    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    @game.add_player(@player)
  end

  it "rolls a high number" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play
    @player.health.should == @initial_health + 15
  end

  it "rolls a medium number" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play
    @player.health.should == @initial_health
  end
  it "rolls a low number" do
    Die.any_instance.stub(:roll).and_return(2)
    @game.play
    @player.health.should == @initial_health -10
  end
end
