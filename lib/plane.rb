require_relative 'airport'

class Plane

  def land(airport)
    fail "Cannot land - hangar is full." if airport.full?
    fail "Cannot land - weather is unfavourable." if airport.stormy?
    airport.hangar.push(self)
  end

  def confirm_departure
    "Departure successful."
  end

end