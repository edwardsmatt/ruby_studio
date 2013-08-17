require_relative 'game'

describe Game do
  before do
    $stdout = StringIO.new
    @game = Game.new("knuckleheads")
    @initial_health = 100
    @number_of_rounds = 2
    @player = Player.new("moe", @initial_health)
    @game.add_player(@player)
  end

  it "rolls a high number" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play(@number_of_rounds)
    @player.health.should == @initial_health + (15 * @number_of_rounds)
  end

  it "rolls a medium number" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play(@number_of_rounds)
    @player.health.should == @initial_health
  end
  it "rolls a low number" do
    Die.any_instance.stub(:roll).and_return(2)
    @game.play(@number_of_rounds)
    @player.health.should == @initial_health - (10 * @number_of_rounds)
  end

  it "assigns a treasure for points during a player's turn" do
    game = Game.new("Knuckleheads")
    player = Player.new("moe")

    game.add_player(player)

    game.play(1)

    player.points.should_not be_zero
  end

  it "computes total points as the sum of all player points" do
    game = Game.new("Knuckleheads")

    player1 = Player.new("moe")
    player2 = Player.new("larry")

    game.add_player(player1)
    game.add_player(player2)

    player1.found_treasure(Treasure.new(:hammer, 50))
    player1.found_treasure(Treasure.new(:hammer, 50))
    player2.found_treasure(Treasure.new(:crowbar, 400))

    game.total_points.should == 500
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end

  it "loads players from a file" do
    game = Game.new("Test Players")
    file_name = File.dirname(__FILE__)+"/players.csv"
    game.load_file(file_name)
    game.number_of_players.should == 3
  end

end
