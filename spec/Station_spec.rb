require 'station'

describe Station do
subject(:station){described_class.new("Bank", 1)}
  describe 'New instance' do
    it 'should check to see station name' do
      expect(station.name).to eq("Bank")
    end
    it 'Should check to see Station zone' do
      expect(station.zone).to eq(1)
      end
  end

end
