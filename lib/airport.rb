class Airport
  attr_reader :hangar
  attr_reader :capacity

  def initialize
    @hangar = []
    @capacity = 1000
  end

  def land(plane)
    fail "Hangar is full." if full?
    @hangar << plane
    @hangar.last
  end

  def launch(plane)
    @hangar.delete(plane)
    plane.confirm_departure
  end

  private

  def full?
    @hangar.count >= @capacity
  end

end