class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
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
    @hangar.count >= 1000
  end

end