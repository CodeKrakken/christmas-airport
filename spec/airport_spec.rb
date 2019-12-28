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

  end

  describe '#launch' do

    let (:plane) { double :plane }

    it 'launches a plane' do
      subject.land(plane)
      expect(subject.launch(plane)).to eq(plane)
    end

  end
end