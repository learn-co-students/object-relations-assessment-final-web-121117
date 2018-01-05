## Movie.all
## returns an array of all movies

## Movie#watchlistings
## returns an array of all the watchlist objects that contain that movie

# Movie#viewers
# returns all of the viewers who added this movie to their watchlist

# Movie#average_rating
# returns the average of all ratings across all viewers watchlist ratings

# Movie.highest_rated
# should return the movie with the highest average rating across all the viewers watchlistings




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
    WatchListing.all.select { |watchlisting| watchlisting.movie == self  }
  end

  def viewers
    watchlistings.map { |watchlisting| watchlisting.viewer }
  end

  def sum_ratings
    ratings.sum
  end

  def ratings
    watchlistings.map { |w| w.rating }
  end

  def average_rating
    ratings.sum / ratings.length
  end

  def self.highest_rated
    self.all.sort_by { |movie| movie.average_rating }.last
  end

end
