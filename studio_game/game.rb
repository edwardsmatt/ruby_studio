require_relative 'player'
require_relative 'die'

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
			number_rolled = Die.new.roll
			case number_rolled
			when 1..2
				player.blam
			when 3..4
				puts "#{player.name} was skipped."
			else
				player.w00t
			end

			puts player
		end
	end
end
