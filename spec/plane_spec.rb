require 'plane'

describe Plane do

  before :each do
    allow(airport).to receive(:class).and_return(Airport)
    allow(airport).to receive(:hangar)
    allow(airport).to receive(:stormy?).and_return(false)
  end

  describe '#land' do

    let(:airport) { double :airport }
    let(:crab) { double :crab }

    before :each do
      subject.flying = true
      allow(airport).to receive(:full?).and_return(false)
    end

    it 'lands a plane' do
      allow(airport).to receive(:hangar)
      allow(airport.hangar).to receive(:push).and_return(subject)
      expect(subject.land(airport)).to eq(subject)
    end

    it 'will not land a plane in a full hangar' do
      allow(airport).to receive(:full?).and_return(true)      
      expect { subject.land(airport) }.to raise_error("Cannot land - hangar is full.")
    end

    it 'will not land a plane if the weather is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.land(airport) }.to raise_error("Cannot land - weather is inclement.")
    end

    it 'will not land in a fictitious airport' do
      expect { subject.land(crab) }.to raise_error("Cannot land - not a valid airport.")
    end

    it 'will not land if already on the ground' do
      subject.flying = false
      expect { subject.land(airport) }.to raise_error("Cannot land - already grounded.")
    end
  end

  describe "#take_off" do

    before :each do
      allow(airport.hangar).to receive(:include?).and_return(true)
    end
  
    let(:airport) { double :airport }
    let(:airport_2) { double :airport_2 }
    let(:crab) { double :crab }  
  
    it 'takes off from an airport and confirms departure' do

      allow(airport.hangar).to receive(:delete)
      expect(subject.take_off(airport)).to eq "Departure successful."
    end
    
    it 'will not take off if it is stormy' do
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.take_off(airport) }.to raise_error("Cannot take off - weather is inclement.")
    end

    it 'will not take off if already in flight' do
      subject.flying = true
      expect { subject.take_off(airport) }.to raise_error("Cannot take off - already in flight.")
    end

    it 'cannot take off from incorrect airport' do
      subject.flying = false
      allow(airport_2).to receive(:class).and_return(Airport)
      allow(airport_2).to receive(:hangar)
      allow(airport_2.hangar).to receive(:include?).and_return(false)
      expect { subject.take_off(airport_2) }.to raise_error("Cannot take off - not in hangar.")
    end

    it 'will not take off from an invalid airport' do
      expect { subject.take_off(crab) }.to raise_error("Cannot take off - not a valid airport.")
    end
  end
end
