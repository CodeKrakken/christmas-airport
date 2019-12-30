require 'plane'

describe Plane do

  describe '#land' do

    let (:airport) {double (:airport) }

    it 'lands a plane' do
      allow(airport).to receive(:hangar)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport.hangar).to receive(:push).and_return(subject)
      expect(subject.land(airport)).to eq(subject)
    end

    it 'will not land a plane in a full hangar' do
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push).and_return(subject)
      expect { subject.land(airport) }.to raise_error("Hangar full.")
    end
  end
end

