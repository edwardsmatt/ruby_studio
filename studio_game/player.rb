require_relative 'treasure_trove'

class Player

  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end

  def self.from_csv(line)
    name, health = line.split(',')
    Player.new(name.chomp, Integer(health))
  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points} and score = #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health + points
  end

  def strong?
    @health > 100 ? true: false
  end

  def <=>(other_player)
    other_player.score <=> self.score
  end

  def found_treasure(treasure)
    @found_treasure[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points}."
    puts "#{@name}'s treasures: #{@found_treasure}"
  end

  def points
    @found_treasure.values.reduce(0, :+)
  end

  def each_found_treasure
    @found_treasure.each do |name, points|
      yield Treasure.new(name, points)
    end
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
