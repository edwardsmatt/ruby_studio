require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
	attr_accessor :title

	def initialize(title)
		@title = title.capitalize
		@players = []
	end

	def add_player(player)
		@players << player
	end

	def number_of_players
		@players.size
	end

	def play
		puts "There are #{number_of_players} players in #{@title}:"
		puts @players
		@players.each do |player|
			GameTurn.take_turn(player)
			puts player
		end
	end
end
