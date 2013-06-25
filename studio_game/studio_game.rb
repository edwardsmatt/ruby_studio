class Player 
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
	end

	def name=(new_name)
  		@name = new_name.capitalize
	end

	def score
		@health + 8
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def w00t
		@health += 15
		puts "#{@name} got w00ted!"
	end

	def to_s
		"I'm #{@name} with a health of #{@health} and a score of #{score}"
	end
end

players = [Player.new("moe", 120), Player.new("larry", 80), Player.new("curly", 145)]
puts "There #{players.size} in the game:"
players.pop
player4 = Player.new("Shemp", 90)
players.push(player4)
players.each do |player|
        player.blam
        player.w00t
        player.w00t
        puts player
end


#player2 = Player.new("larry", 60)
#puts player2.name
#player2.name = "lawrence"
#puts player2.name
#puts player2.health
#puts player2.score
#puts player2
