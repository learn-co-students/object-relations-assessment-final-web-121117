## Movie.all
#   + returns an array of all movies
# + Movie#watchlistings
#   + returns an array of all the watchlist
#   objects that contain that movie
# + Movie#viewers
#   + returns all of the viewers who added this movie to their watchlist
# + Movie#average_rating
#   + returns the average of all ratings across all viewers watchlist ratings
# + Movie.highest_rated
#   + should return the movie with the highest average rating across all the viewers watchlistings

class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def watchlistings
    WatchListing.all.map do |list_movie|
      list_movie.movie.title == self.title
    end
  end

  def viewers
    WatchListing.all.map do |list_movie|
      if list_movie.movie.title == self.title
        list_movie.viewer
      end
    end
  end

  def average_rating
    rating_array = WatchListing.all.map do |list_movie|
      if list_movie.movie.title == self.title
        list_movie.rating
      end
    end
    total = 0
    rating_array.each do |rating|
      total += rating
    end
    total / rating_array.length
  end

  def self.highest_rated
    current_high_rate = 0
    current_high_movie = ""
    Movie.all.each do |list_movie|
      if list_movie.average_rating > current_high_rate
        current_high_rate = list_movie.average_rating
        current_high_movie = list_movie.movie.title
      end
    end
    current_high_movie
  end

end
