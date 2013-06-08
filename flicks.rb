def weekday 
	Time.new.strftime("%A")
end

def movie_listing(title, rank=0)
	"#{weekday.upcase}: #{title.capitalize} has a rank of #{rank}"
end

puts movie_listing("goonies", 10)
puts movie_listing("ghostbusters", 9)

puts movie_listing("goldfinger")