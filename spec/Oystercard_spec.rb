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
			expect(subject).to respond_to(:top_up).with(1).argument
		end
			it 'should return 12' do
			expect(subject.top_up(12)).to eq 12
		end

		context 'Limit should set at 90' do
			it 'should raise error if limit exceed 90' do
			stub_const("DEFAULT_LIMIT", 90)
			err_message = "Limit is #{DEFAULT_LIMIT}, declined"	
			expect{subject.top_up(91)}.to raise_error(err_message)
			end
		end

	end

	end

end
