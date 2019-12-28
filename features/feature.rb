require './lib/plane.rb'
plane = Plane.new
airport = Airport.new
airport.land(plane)
airport.launch(plane)
airport.capacity.times { airport.land(Plane.new) }
airport.land(plane)
