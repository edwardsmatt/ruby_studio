require_relative 'game'
require_relative 'player'

knuckleheads = Game.new("knuckleheads")

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end


# moe = Player.new("moe")
# larry = Player.new("larry", 60)
# curly = Player.new("curly", 125)


# knuckleheads.add_player(moe)
# knuckleheads.add_player(larry)
# knuckleheads.add_player(curly)

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
