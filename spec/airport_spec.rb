require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to launch' do
    expect(subject).to respond_to(:launch)
  end

  describe '#land' do
  
    let (:plane) { double :plane }

    it 'lands a plane' do
      expect(subject.land(plane)).to eq(plane)
    end

    it 'will not land a plane when the hangar is full' do
      1000.times { subject.land(double('plane')) }
      expect { subject.land(plane) }.to raise_error("Hangar is full.")
    end

  end

  describe '#launch' do

    let (:plane) { double :plane }

    it 'launches a plane and confirms that the plane has departed' do
      subject.land(plane)
      allow(plane).to receive(:confirm_departure).and_return("Departure successful.")
      expect(subject.launch(plane)).to eq("Departure successful.")
    end

  end

end