# + Movie.all DONE
#   + returns an array of all movies

# + Movie#watchlistings DONE
#   + returns an array of all the watchlist objects that contain that movie

# + Movie#viewers #intance method DONE
#   + returns all of the viewers who added this movie to their watchlist

# + Movie#average_rating DONE
#   + returns the average of all ratings across all viewers watchlist ratings

# + Movie.highest_rated
#   + should return the movie with the highest average rating across all the viewers watchlistings



class Movie
  attr_accessor :movie_title

  @@all = []

  def initialize(movie_title)
    @movie_title = movie_title
    @@all << self
  end

  def self.all
    @@all
  end


  def watchlistings #that contain that movie
    WatchListing.all.select do |watch_listing_instance| #iterate over WL array
      watch_listing_instance.movie == self #return an array
    end
  end

  def viewers #iterating through watchlistings array
    watchlistings.collect do |wl_instance|
      wl_instance.viewer #returns an array
    end
  end

  def ratings
   watchlistings.collect do |viewer_wl_instance|
     viewer_wl_instance.rating
    end
  end

  def sum_ratings
    sum_ratings = ratings.inject(0) {|movie_rating, i|  movie_rating + i }
      sum_ratings
  end

  def average_rating
    sum_ratings/watchlistings.count
  end

  def self.highest_rated
    Watchlisting.all.collect |wl_instance|
    wl_instance.rating
  end


end
