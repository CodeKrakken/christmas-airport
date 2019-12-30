require 'plane'

describe Plane do

  describe '#land' do

    let (:airport) {double (:airport) }

    it 'responds to #land' do
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push).and_return(subject)
      expect(subject.land(airport)).to eq(subject)
    end
  end
end

