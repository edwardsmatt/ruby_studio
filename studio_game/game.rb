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

	def play(rounds)
		puts "There are #{number_of_players} players in #{@title}:"
		puts @players
		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end
end
