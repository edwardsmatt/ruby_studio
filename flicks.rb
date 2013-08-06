class Movie
  def initialize(title, rank=0)
    @title = title
    @rank = rank
  end	
  
  def thumbs_up
    @rank+=1
  end
  def to_s
     "Created movie with title '#{@title}' and rank '#{@rank}'"
  end
end

class Playlist
  def initialize(name)
    @name = name
    @movies=[]
  end

  def add_movie(movie)
    @movies << movie
  end

  def play
    puts "#{@name}'s Playlist:"
    puts @movies

    @movies.each do |movie|
      movie.thumbs_up
      puts movie
    end
  end
end

      
movie1 = Movie.new("Goonies", 10)
movie2 = Movie.new("ghostbusters", 9)
movie3 = Movie.new("Goldfinger")

playlist = Playlist.new("Kermit")
playlist.add_movie(movie1)
playlist.add_movie(movie2)
playlist.add_movie(movie3)
playlist.play
