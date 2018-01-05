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

  def rating_rate
    rating_rate = rating(1..5)
  end

  def rate_movie(movie, rating)
    find_movie = WatchListing.all.find {|watchlisting_instance| watchlisting_instance.movie == movie}
    find_movie.rating == rating
  end


end
