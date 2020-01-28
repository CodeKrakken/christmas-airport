require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land)
  end

  describe '#land' do
  
    let (:plane) { double :plane }

    it 'lands a plane' do
      expect(subject.land(plane)).to eq(plane)
    end

  end
end