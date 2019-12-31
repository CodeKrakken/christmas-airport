require './lib/plane.rb'
plane = Plane.new
airport = Airport.new
airport_2 = Airport.new(500)
# Plane not land not an airport
plane.land(crab)
# Plane not land stormy
srand(5)
plane.land(airport)
# Plane not land full
1000.times { srand(500); Plane.new.land(airport) }
plane.land(airport)
# Plane land
plane.land(airport_2)
# Plane not land, already on ground
plane.land(airport_2)
# Plane not take off stormy
plane.take_off(airport_2)
# Plane not take off not an airport
plane.take_off(crab)
# Plane not take off wrong airport
plane.take_off(airport)
# Plane take off
plane.take_off(airport_2)
# Plane not take off, already flying
plane.take_off(airport_2)