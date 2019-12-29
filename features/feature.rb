require './lib/plane.rb'
plane = Plane.new
airport = Airport.new
airport.land(plane)
airport.launch(plane)
airport.capacity.times { airport.land(Plane.new) }
airport.land(plane)
airport_2 = Airport.new(2000)
2000.times { airport_2.land(Plane.new) }
airport_2.land(plane)