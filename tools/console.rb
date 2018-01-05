require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


# Viewers
v1 = Viewer.new("viewer1")
v2 = Viewer.new("viewer2")
v3 = Viewer.new("viewer3")
v4 = Viewer.new("viewer4")
v5 = Viewer.new("viewer5")

# Movies
m1 = Movie.new("movie1")
m2 = Movie.new("movie2")
m3 = Movie.new("movie3")
m4 = Movie.new("movie4")
m5 = Movie.new("movie5")

#Watchlistings
w1 = WatchListing.new(v1,m1)
w2 = WatchListing.new(v2,m2)
w3 = WatchListing.new(v3,m3)
w4 = WatchListing.new(v4,m4)
w5 = WatchListing.new(v5,m5)

Pry.start
