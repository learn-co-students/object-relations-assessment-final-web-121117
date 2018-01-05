class WatchListing

  attr_reader :viewer, :movie, :rating

  @@all = []

  def self.all
    @@all
  end

  def initialize(viewer, movie, rating=nil)
    @rating = rating
    @viewer = viewer
    @movie = movie
    @@all << self
  end

  def rating
    self.movie.rating
  end

end
