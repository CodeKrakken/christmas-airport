require './lib/plane.rb'
plane = Plane.new
plane.flying = true
airport = Airport.new
airport_2 = Airport.new(500)
crab = Array.new
plane.land(crab)
srand(5)
plane.land(airport)
1000.times do 
  srand(500)
  another_plane = Plane.new
  another_plane.flying = true
  another_plane.land(airport)
end
plane.land(airport)
srand(500)
plane.land(airport_2)
plane.land(airport_2)
srand(5)
plane.take_off(airport_2)
plane.take_off(crab)
plane.take_off(airport)
srand(500)
plane.take_off(airport_2)
plane.take_off(airport_2)