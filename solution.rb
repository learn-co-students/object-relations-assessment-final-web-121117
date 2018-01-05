# Please copy/paste all three classes into this file to submit your solution!

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
    WatchListing.all.map do |list_movie|
      list_movie.movie.title == self.title
    end
  end

  def viewers
    WatchListing.all.map do |list_movie|
      if list_movie.movie.title == self.title
        list_movie.viewer
      end
    end
  end

  def average_rating
    rating_array = WatchListing.all.map do |list_movie|
      if list_movie.movie.title == self.title
        list_movie.rating
      end
    end
    total = 0
    rating_array.each do |rating|
      total += rating
    end
    total / rating_array.length
  end

  def self.highest_rated
    current_high_rate = 0
    current_high_movie = ""
    Movie.all.each do |list_movie|
      if list_movie.average_rating > current_high_rate
        current_high_rate = list_movie.average_rating
        current_high_movie = list_movie.movie.title
      end
    end
    current_high_movie
  end

end

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
    movies.each do |movie|
      WatchListing.new(self.username, movie.title)
    end
  end

  def rate_movie(movie, rating)
    WatchListing.new(self.username, movie, rating)
  end

end


class WatchListing

  attr_accessor :viewer, :movie, :rating
  @@all = []

  def initialize(viewer, movie, rating = nil)
    @viewer = viewer
    @movie = movie
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
