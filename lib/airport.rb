class Airport
  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity = 1000)
    @hangar = []
    @capacity = capacity
  end

  # private

  def stormy?
    rand(10) == 3
  end

  def full?
    @hangar.count >= @capacity
  end

end