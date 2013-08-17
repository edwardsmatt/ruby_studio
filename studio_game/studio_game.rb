require_relative 'game'
require_relative 'player'

game = Game.new("Knuckleheads")
game.load_file(ARGV.shift || "players.csv")
loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    game.play(answer.to_i)
  when 'quit', 'exit'
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

game.print_stats
game.save_high_scores
