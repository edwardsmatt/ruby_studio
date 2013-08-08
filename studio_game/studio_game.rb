class Player

  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end
  
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
  
  def score
    @health + @name.length
  end
  
end

class Game
	attr_accessor :title

	def initialize(title)
		@title = title.capitalize
		@players = []
	end

	def add_player(player)
		@players << player
	end

	def play
		puts "There are #{@players.size} players in #{@title}:"
		puts @players
		@players.each do |player| 
			player.blam
			player.w00t
			player.w00t
			puts player
		end
	end
end

knuckleheads = Game.new("knuckleheads")
moe = Player.new("moe")
larry = Player.new("larry", 60)
curly = Player.new("curly", 125)


knuckleheads.add_player(moe)
knuckleheads.add_player(larry)
knuckleheads.add_player(curly)

knuckleheads.play


chipmunks = Game.new("chipmunks")
alvin = Player.new("alvin")
simon = Player.new("simon", 60)
theodore = Player.new("theodore", 125)


chipmunks.add_player(alvin)
chipmunks.add_player(simon)
chipmunks.add_player(theodore)

chipmunks.play

