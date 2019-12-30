require_relative 'airport'

class Plane

  def land(airport)
    airport.hangar.push(self)
  end

  def confirm_departure
    "Departure successful."
  end

end