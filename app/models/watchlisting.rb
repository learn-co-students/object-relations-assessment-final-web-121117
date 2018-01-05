# Watchlisting.all
# returns all of watchlistings

# Watchlisting#viewer
# returns the viewer associated with this watchlisting

# Watchlisting#movie
# returns the movie associated with this watchlisting

# Watchlisting#rating
# returns the viewer's rating for the movie associated with this watchlisting



class WatchListing

  attr_accessor :viewer, :movie, :rating

  @@all = []

  def initialize(viewer, movie)
    @viewer = viewer
    @movie = movie
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
