require_relative 'player'

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