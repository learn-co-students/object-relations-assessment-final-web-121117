# + Watchlisting.all DONE
#   + returns all of watchlistings
# + Watchlisting#viewer DONE
#   + returns the viewer associated with this watchlisting
# + Watchlisting#movie DONE
#   + returns the movie associated with this watchlisting
# + Watchlisting#rating DONE
#   + returns the viewer's rating for the movie associated with this watchlisting



class WatchListing

  attr_reader :viewer, :movie, :rating
  @@all = []

  def initialize(viewer, movie, rating)
    @viewer = viewer
    @movie = movie
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end


end
