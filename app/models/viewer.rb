#
# ### VIEWER
#
# + Viewer.all
#   + returns all of the viewers
# + Viewer#add_to_watchlist(movies)
#   + this method should receive an array of one or more movie instances and add them to the viewer's watchlisting
# + Viewer#rate_movie(movie, rating)
#   + given a movie on a viewer's watchlisting and a rating (a number between 1 and 5), assign the rating to the movie. Where should the rating that an individual viewer gives to an individual movie be stored?

class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
  end

  def self.all
    @@all
  end

# works
  def add_to_watchlist(movie_instance_array)
    movie_instance_array.each do |movie_instance|
      WatchListing.new(self,movie_instance)
    end

  end
  # works 
  def rate_movie(movie,rating)
    # newly_rated_movie = WatchListing.new(self,movie)
    # newly_rated_movie.rating = rating
    movie_wl_to_rate = WatchListing.all.find{|watchlisting| watchlisting.movie == movie}
    movie_wl_to_rate.rating = rating

    # movie_to_rate
    # movie_to_rate.rating = rating
  end
end
