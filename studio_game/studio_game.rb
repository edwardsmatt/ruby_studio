require_relative 'game'
require_relative 'player'

knuckleheads = Game.new("knuckleheads")
moe = Player.new("moe")
larry = Player.new("larry", 60)
curly = Player.new("curly", 125)


knuckleheads.add_player(moe)
knuckleheads.add_player(larry)
knuckleheads.add_player(curly)

knuckleheads.play


chipmunks = Game.new("chipmunks")
alvin = Player.new("alvin")
simon = Player.new("simon", 60)
theodore = Player.new("theodore", 125)


chipmunks.add_player(alvin)
chipmunks.add_player(simon)
chipmunks.add_player(theodore)

chipmunks.play

