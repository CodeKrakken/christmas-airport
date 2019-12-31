require 'plane'

describe Plane do

  describe '#land' do

    let (:airport) { double (:airport) }
    let (:crab) { double (:crab) }

    it 'lands a plane' do
      allow(airport).to receive(:hangar)
      allow(airport).to receive(:class).and_return(Airport)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport.hangar).to receive(:push).and_return(subject)
      allow(airport).to receive(:stormy?).and_return(false)
      subject.flying = true
      expect(subject.land(airport)).to eq(subject)
    end

    it 'will not land a plane in a full hangar' do
      allow(airport).to receive(:class).and_return(Airport)
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push).and_return(subject)
      subject.flying = true
      expect { subject.land(airport) }.to raise_error("Cannot land - hangar is full.")
    end

    it 'will not land a plane if the weather is stormy' do
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push)
      allow(airport).to receive(:stormy?).and_return(true)
      allow(airport).to receive(:class).and_return(Airport)
      subject.flying = true
      expect { subject.land(airport) }.to raise_error("Cannot land - weather is inclement.")
    end

    it 'will not land in a fictitious airport' do
      subject.flying = true
      expect { subject.land(crab) }.to raise_error("Cannot land - not a valid airport.")
    end

    it 'will not land if already on the ground' do
      allow(airport).to receive(:class).and_return(Airport)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push)
      subject.flying = true
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("Cannot land - already grounded.")
    end
  end

  describe "#take_off" do
  
    let (:airport) { double (:airport) }
    let (:airport_2) { double (:airport_2) }
    let (:crab) { double (:crab) }  
  
    it 'takes off from an airport and confirms departure' do
      allow(airport).to receive(:hangar)
      allow(airport).to receive(:class).and_return(Airport)
      allow(airport.hangar).to receive(:delete)
      allow(airport).to receive(:stormy?).and_return(false)
      allow(airport.hangar).to receive(:include?).and_return(true)
      expect(subject.take_off(airport)).to eq "Departure successful."
    end
    
    it 'will not take off if it is stormy' do
      allow(airport).to receive(:class).and_return(Airport)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:delete)
      allow(airport).to receive(:stormy?).and_return(true)
      allow(airport.hangar).to receive(:include?).and_return(true)
      expect { subject.take_off(airport) }.to raise_error("Cannot take off - weather is inclement.")
    end

    it 'will not take off if already in flight' do
      allow(airport).to receive(:class).and_return(Airport)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push)
      allow(airport.hangar).to receive(:delete)
      allow(airport.hangar).to receive(:include?).and_return(true)
      subject.flying = true
      subject.land(airport)
      subject.take_off(airport)
      expect { subject.take_off(airport) }.to raise_error("Cannot take off - already in flight.")
    end

    it 'must take off from correct airport' do
      allow(airport).to receive(:class).and_return(Airport)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:stormy?).and_return(false)
      subject.flying = true
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push)
      allow(airport_2).to receive(:hangar)
      allow(airport_2.hangar).to receive(:include?)
      subject.land(airport)
      allow(airport_2).to receive(:class).and_return(Airport)
      expect { subject.take_off(airport_2) }.to raise_error("Cannot take off - not at this airport.")
    end

    it 'will not take off from an invalid airport' do
      expect { subject.take_off(crab) }.to raise_error("Cannot take off - not a valid airport.")
    end
  end
end

