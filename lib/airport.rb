class Airport
  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity = 1000)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane cannot land - weather is unfavourable." if stormy?
    fail "Hangar is full." if full?
    @hangar << plane
    @hangar.last
  end

  def launch(plane)
    @hangar.delete(plane)
    plane.confirm_departure
  end

  private

  def stormy?
    rand(10) == 3
  end

  def full?
    @hangar.count >= @capacity
  end

end