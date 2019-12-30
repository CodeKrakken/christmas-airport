require_relative 'airport'

class Plane

  def land(airport)
    fail "Cannot land - hangar is full." if airport.full?
    fail "Cannot land - weather is unfavourable." if airport.stormy?
    airport.hangar.push(self)
  end

  def take_off(airport)
    airport.hangar.delete(self)
    "Departure successful."
  end

end