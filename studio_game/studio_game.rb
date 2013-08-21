require_relative 'game'
require_relative 'player'
require_relative 'berserk_player'
require_relative 'clumsy_player'





game = StudioGame::Game.new("Knuckleheads")
game.load_file(ARGV.shift || "players.csv")
game.add_player(StudioGame::BerserkPlayer.new("berserker", 50))
game.add_player(StudioGame::ClumsyPlayer.new("klutz", 105, 10))

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
