require './lib/plane.rb'
plane = Plane.new
airport = Airport.new
srand(5)
airport.land(plane)
srand(500)
airport.land(plane)
srand(5)
airport.launch(plane)
srand(500)
airport.launch(plane)
airport.capacity.times { srand(500); airport.land(Plane.new) }
airport.land(plane)
airport_2 = Airport.new(2000)
2000.times { srand(500); airport_2.land(Plane.new) }
airport_2.land(plane)
