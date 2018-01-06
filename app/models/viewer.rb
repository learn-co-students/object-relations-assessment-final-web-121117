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

  def add_to_watchlist(movies)
    movies.map do |movie|
      WatchListing.new(self, movie)
    end
  end

  def rate_movie(movie, rating)
    find_movie = WatchListing.all.find {|watchlisting_instance| watchlisting_instance.movie == movie}
    if rating <= 5
      find_movie.rating == rating
    else
      nil
    end
  end

end
