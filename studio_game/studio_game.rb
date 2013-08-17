require_relative 'game'
require_relative 'player'

knuckleheads = Game.new("knuckleheads")
knuckleheads.load_file(ARGV.shift || "players.csv")
loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i) do
			knuckleheads.total_points >= 2000
		end
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end


# knuckleheads.play(10) do
# 	knuckleheads.total_points >= 2000
# end
# knuckleheads.print_stats

# chipmunks = Game.new("chipmunks")
# alvin = Player.new("alvin")
# simon = Player.new("simon", 60)
# theodore = Player.new("theodore", 125)


# chipmunks.add_player(alvin)
# chipmunks.add_player(simon)
# chipmunks.add_player(theodore)

# chipmunks.play (2)
# chipmunks.print_stats
