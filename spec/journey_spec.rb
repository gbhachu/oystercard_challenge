require 'journey'

describe Journey do
subject(:journey){described_class.new(start_station.name)}
let(:card) {double :card}
let(:start_station) {double :start_station, name: "Bank", zone: 1}

  it 'needs to remember entry station' do
    allow(card).to receive(:touch_in)
    card.touch_in(start_station)
    puts start_station
    expect(journey.entry_station).to eq "Bank"
    puts journey.entry_station
  end

  it 'stores exit station' do

  end

  it 'sould return min fare or penalty charge of 6' do

  end
end
