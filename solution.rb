
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

class WatchListing
  attr_accessor :viewer, :movie, :rating

  @@all = []

  def initialize(viewer,movie)
    @viewer = viewer
    @movie = movie
    @rating = rating
    @@all << self
  end
  def self.all
    @@all
  end


end
