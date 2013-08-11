require_relative 'player'

describe Player do
  before do
    $stdout = StringIO.new
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
  end

  it "has a capitalized name" do
    @player = Player.new("larry", @initial_health)
    @player.name.should == "Larry"
  end

  it "has an initial health" do
    @player.health.should == @initial_health
  end

  it "has a string representation" do
    @player.to_s.should == "I'm Larry with a health of #{@initial_health} and a score of #{@initial_health + @player.name.length}."
  end

  it "computes a score as the sum of its health and length of name" do
    @player.score.should == @initial_health + @player.name.length
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end

  context "with a health over 100" do
    before do
      @player = Player.new("muscles", 150)
    end
    it "is strong" do
      # @player.strong?.should be_true
      @player.should be_strong
    end
  end

  context "with a health less than or equal to 100" do
    before do
      @player = Player.new("wimpy", 100)
    end
    it "is wimpy" do
      # @player.strong?.should be_false
      @player.should_not be_strong
    end
  end
end
