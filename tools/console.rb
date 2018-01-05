require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

bob = Viewer.new("Bob")
carl = Viewer.new("Carl")
matrix = Movie.new("The Matrix")
cool = Movie.new("Cool Runnings")
happening = Movie.new("The Happening")
movie_array_1 = [matrix,cool]
movie_array_2 = [cool,happening]
bob.add_to_watchlist(movie_array_1)
carl.add_to_watchlist(movie_array_2)
bob.rate_movie(matrix,5)
carl.rate_movie(cool,9)
carl.rate_movie(matrix,9)
bob.rate_movie(cool,6)

Pry.start
