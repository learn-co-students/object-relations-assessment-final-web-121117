require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end

tania = Viewer.new("tania")
tan = Viewer.new("tan")
movie1 = Movie.new("movie1")
movie2 = Movie.new("movie2")
list = WatchListing.new(tania, movie1)
list2= WatchListing.new(tan, movie2)


binding.pry
puts "hello"
