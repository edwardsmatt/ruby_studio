require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

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

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"
		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points"
		end

		1.upto(rounds) do |round|
			puts "\nRound #{round}:"
			@players.each do |player|
				GameTurn.take_turn(player)
			end
		end
	end

	def print_stats
		puts "#{@title} Statistics:"
		strong, wimpy = @players.partition {|player| player.strong?}
		puts "\n#{strong.size} strong players:"
		strong.each do |player|
			print_name_and_health(player)
		end
		puts "\n#{wimpy.size} wimpy players:"
		wimpy.each do |player|
			print_name_and_health(player)
		end
		print_point_totals
		print_high_scores
	end

	def print_point_totals

		@players.sort.each do |player|
			puts "\n#{player.name}'s point totals:"
		  puts "#{player.points} grand total points"
		end
	end

	def print_name_and_health (player)
			puts "#{player.name} (#{player.score})"
	end

	def print_high_scores
		puts "\n#{@title} High Scores:"
		@players.sort.each { |player|  puts "#{player.name.ljust(20, '.')} (#{player.score})" }
	end
end
