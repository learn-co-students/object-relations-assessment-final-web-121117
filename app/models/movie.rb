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
    WatchListing.all.select {|watchlisting_instance| watchlisting_instance.rating >= 4}
  end


end
