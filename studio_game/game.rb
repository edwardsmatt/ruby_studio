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

	def load_file(file_name)
		File.foreach(file_name) do |line|
			add_player(Player.from_csv(line))
		end
	end

	def save_high_scores(to_file="high_scores.txt")
		File.open(to_file, "w") do |file|
			file.puts "#{@title} High Scores:"
			@players.sort.each { |player|  file.puts high_score_output(player) }
		end
	end

	def high_score_output(player)
		"#{player.name.ljust(20, '.')} (#{player.score})"
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
			if block_given? and yield
				puts "Game has ended after #{round} rounds..."
				break
			end
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
		puts "#{total_points} total points from treasures found"
	end

	def print_point_totals

		@players.sort.each do |player|
			puts "\n#{player.name}'s point totals:"
			player.each_found_treasure do |treasure|
  			puts "#{treasure.points} total #{treasure.name} points"
			end
		  puts "#{player.points} grand total points"
		end
	end

	def print_name_and_health (player)
			puts "#{player.name} (#{player.score})"
	end

	def print_high_scores
		puts "\n#{@title} High Scores:"
		@players.sort.each { |player|  puts high_score_output(player) }
	end

	def total_points
		@players.reduce(0) do |sum, player|
			sum + player.points
		end
	end
end
