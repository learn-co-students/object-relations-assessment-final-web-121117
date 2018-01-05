# Viewer.all
# returns all of the viewers

# Viewer#add_to_watchlist(movies)
# this method should receive an array of one or more movie instances and add them to the viewer's watchlisting

# Viewer#rate_movie(movie, rating)
# given a movie on a viewer's watchlisting and a rating (a number between 1 and 5), assign the rating to the movie. Where should the rating that an individual viewer gives to an individual movie be stored?



class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    @@all << self
  end

  def self.all
    @@all
  end


  def add_to_watchlist(movies)
    movies.each do |movie|
      WatchListing.new(self, movie)
    end
  end

  # does not work
  def rate_movie(movie, rating)
    WatchListing.all.each do |w|
      w.rating = rating #where w.movie == movie
    end
  end

end
