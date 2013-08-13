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
		puts "\nThere are #{number_of_players} players in #{@title}:"
		puts @players
		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end

	def print_stats
		puts "#{@title} Statistics:"
		strong, wimpy = @players.partition {|player| player.strong?}
		puts "\n#{strong.size} strong players:"
		strong.each do |player|
			puts "#{player.name} (#{player.score})"
		end
		puts "\n#{wimpy.size} wimpy players:"
		wimpy.each do |player|
			puts "#{player.name} (#{player.score})"
		end
		print_high_scores
	end

	def print_high_scores
		puts "\n#{@title} High Scores:"
		@players.sort {|a, b| b.score <=> a.score}.each do |player|
			formatted_name = "#{player.name.ljust(20, '.')}"
			puts "#{formatted_name} (#{player.score})"
		end
	end
end
