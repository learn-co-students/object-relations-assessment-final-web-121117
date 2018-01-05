# + Viewer.all DONE
#   + returns all of the viewers

# + Viewer#add_to_watchlist(movies) #instance method DONE
#   + this method should receive an array of one or more movie instances and add
# => them to the viewer's watchlisting

# + Viewer#rate_movie(movie, rating) #instance method
#   + given a movie on a viewer's watchlisting and a rating (a number between 1 and 5),
# =>  assign the rating to the movie.
#  Where should the rating that an individual viewer gives to an individual movie be stored?



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

  def add_to_watchlist(movies) #movies array
    movies.each do |movie_instance| #iterating over each instance
      WatchListing.new(self, movie_instance)  #add them to the viewer's watchlist(viewer,movie)
    end
  end

  def rate_movie(movie, rating)
    WatchListing.new(self, movie, rating)
  end

end
