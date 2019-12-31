require 'airport'

describe Airport do
  let (:plane) { double (:plane) }

  it 'has a default capacity of 1000' do
    expect(subject.capacity).to eq(1000)
  end

  it 'default capacity can be overridden' do
    airport = Airport.new(500)
    expect(airport.capacity).to eq(500)
  end

  # comment out airport.rb:10 to run private method tests
  
  it 'can test if it is full' do
    expect(subject.full?).to eq(false)
  end

end