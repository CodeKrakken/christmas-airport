require_relative 'airport'

class Plane

  def land(airport)
    fail "Hangar full." if airport.full?
    airport.hangar.push(self)
  end

  def confirm_departure
    "Departure successful."
  end

end