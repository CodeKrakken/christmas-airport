require 'airport'

describe Airport do
  let (:plane) { double (:plane) }

  it 'responds to land' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to launch' do
    expect(subject).to respond_to(:launch)
  end

  it 'has a default capacity of 1000' do
    expect(subject.capacity).to eq(1000)
  end

  it 'default capacity can be overridden' do
    airport = Airport.new(500)
    500.times { srand(500); airport.land(double(plane)) }
    expect { airport.land(plane) }.to raise_error("Hangar is full.")
  end

  describe '#land' do
  
    let (:plane) { double :plane }

    it 'lands a plane' do
      expect(subject.land(plane)).to eq(plane)
    end

    it 'will not land a plane when the hangar is full' do
      1000.times { srand(500); subject.land(double('plane')) }
      expect { subject.land(plane) }.to raise_error("Hangar is full.")
    end

    it 'will not land a plane when the weather is stormy' do
      srand(5)
      expect { subject.land(plane) }.to raise_error("Plane cannot land - weather is unfavourable.")
    end

  end

  describe '#launch' do

    let (:plane) { double :plane }

    it 'launches a plane and confirms that the plane has departed' do
      srand(2)
      subject.land(plane)
      allow(plane).to receive(:confirm_departure).and_return("Departure successful.")
      expect(subject.launch(plane)).to eq("Departure successful.")
    end

  end

end