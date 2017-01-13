require 'journey'

describe Journey do
subject(:journey){described_class.new(start_station.name)}
let(:start_station) {double :start_station, name: "Bank", zone: 1}
let(:end_station) {double :end_station, name: "Euston", zone: 2}

  it 'stores entry station' do
    expect(journey.entry_station).to eq "Bank"
  end

  it 'stores exit station' do
    journey.end_journey("Euston")
  expect(journey.end_station).to eq "Euston"




  end

  it 'sould return min fare or penalty charge of 6' do

  end
end
