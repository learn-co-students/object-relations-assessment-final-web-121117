#
# ### MOVIE
#
# + Movie.all
#   + returns an array of all movies
# + Movie#watchlistings
#   + returns an array of all the watchlist objects that contain that movie
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
  # works
  def watchlistings
    WatchListing.all.select{|watchlisting_instance| watchlisting_instance.movie == self }
  end

  # WORKS
  def viewers
    view_array = watchlistings.map{|watchlisting_instance| watchlisting_instance.viewer}
  end

  # WORKS
  def average_rating
    #   + returns the average of all ratings across all viewers watchlist ratings
    all_ratings = watchlistings.map{|watchlisting_instance| watchlisting_instance.rating}
    all_ratings_no_nil = all_ratings.compact
    rating_sum = 0
    all_ratings_no_nil.each do |rating|
      rating_sum += rating
    end
    rating_average = rating_sum / all_ratings_no_nil.length
    rating_average
  end

  def self.highest_rated
    movie_rating_hash = Hash.new(0)
    WatchListing.all.each do |watchlisting|
      movie_title = watchlisting.movie.title
      movie_rating = watchlisting.rating

      movie_rating_hash[:movie_title] = movie_rating

    end

    movie_rating_hash.max_by{|movie,rating| rating}

  end

end
