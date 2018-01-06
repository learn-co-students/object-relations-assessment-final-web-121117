class Movie
  attr_accessor :title

  # Movie.highest_rated
  # should return the movie with the highest average rating across all the viewers watchlistings
  @@all = []

  def self.all
    @@all
  end

  def initialize(title)
    @title = title
    self.class.all << self
  end


  def watchlistings
    WatchListing.all.select {|watchlisting_instance| watchlisting_instance.movie == self}
  end

  def viewers
    self.watchlistings.map {|watchlisting| watchlisting.viewer}
  end

  def average_rating
    get_rating = self.watchlistings.map {|watchlisting| watchlisting.rating}
    rating_array = get_rating.size
    sum_of_all_ratings = get_rating.inject(0){|sum, x| sum + x}
    average_rating = sum_of_all_ratings / rating_array
  end

  def self.highest_rated
    ratings_collection = WatchListing.all.map {|watchlisting_instance| watchlisting_instance.rating}
    sorterd_ratings_collection = ratings_collection.sort[-1]
  end

end
