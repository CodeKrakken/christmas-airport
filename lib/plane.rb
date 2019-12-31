require_relative 'airport'

class Plane
  attr_accessor :flying

  def initialize
    @flying = false
  end

  def land(airport)
    fail "Cannot land - already grounded." unless @flying
    fail "Cannot land - not a valid airport." if airport.class != Airport
    fail "Cannot land - hangar is full." if airport.full?
    fail "Cannot land - weather is inclement." if airport.stormy?
    @flying = false
    airport.hangar.push(self)
  end

  def take_off(airport)
    fail "Cannot take off - already in flight." if @flying
    fail "Cannot take off - not a valid airport." if airport.class != Airport
    fail "Cannot take off - not at this airport." if !airport.hangar.include? self
    fail "Cannot take off - weather is inclement." if airport.stormy?
    airport.hangar.delete(self)
    @flying = true
    "Departure successful."
  end

end