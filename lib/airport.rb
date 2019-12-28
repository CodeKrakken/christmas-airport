class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    @hangar.last
  end

  def launch(plane)
    @hangar.delete(plane)
  end

end