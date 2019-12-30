require 'plane'

describe Plane do

  describe '#land' do

    let (:airport) {double (:airport) }

    it 'lands a plane' do
      allow(airport).to receive(:hangar)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport.hangar).to receive(:push).and_return(subject)
      allow(airport).to receive(:stormy?).and_return(false)
      expect(subject.land(airport)).to eq(subject)
    end

    it 'will not land a plane in a full hangar' do
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push).and_return(subject)
      expect { subject.land(airport) }.to raise_error("Cannot land - hangar is full.")
    end

    it 'will not land a plane if the weather is stormy' do
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.land(airport) }.to raise_error("Cannot land - weather is inclement.")
    end
  end

  describe "#take_off" do
  
    let (:airport) { double (:airport) }  
  
    it 'takes off from an airport and confirms departure' do
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:delete)
      allow(airport).to receive(:stormy?).and_return(false)
      expect(subject.take_off(airport)).to eq "Departure successful."
    end
    
    it 'will not take off if it is stormy' do
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:delete)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.take_off(airport) }.to raise_error("Cannot take off - weather is inclement.")
    end
  end
end

