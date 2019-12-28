require './lib/plane.rb'
plane = Plane.new
airport = Airport.new
airport.land(plane)
airport.launch(plane)