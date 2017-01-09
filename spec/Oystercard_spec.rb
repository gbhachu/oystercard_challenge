require 'oystercard'

describe Oystercard do
#subject(:oystercard) { described_class.new}
	it 'should have a balance of 0' do
		expect(subject).to have_attributes(:balance => 0)
	end

	#/it 'should have a balance of 20' do
		#expect(Oystercard.new(20)).to have_attributes(:amount =>20)
	#end/



	describe '#top_up' do
		context 'should allow card to be topped up' do
			it 'should responds to one arguement' do
			oystercard = Oystercard.new
			expect(oystercard).to respond_to(:top_up).with(1).argument
		end
			it 'should return 12' do
			expect(subject.top_up(12)).to eq 12
		end
	end

	end

end
