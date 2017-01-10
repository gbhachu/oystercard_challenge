require 'oystercard'

describe Oystercard do
subject(:card){ described_class.new}

	describe 'New instance' do
		it 'should have a balance of 0' do
		expect(card).to have_attributes(:balance => 0)
		end
	end

	describe '#top_up' do
		context 'should allow card to be topped up' do
				it 'should responds to one arguement' do
				expect(card).to respond_to(:top_up).with(1).argument
				end
				it 'should return 12' do
				expect(card.top_up(12)).to eq 12
				end
		end

		context 'Limit should set at 90' do
			it 'should raise error if limit exceed 90' do
			default_limit = Oystercard::DEFAULT_LIMIT
			card.top_up(default_limit)
			expect{card.top_up(1)}.to raise_error("Limit is #{default_limit}, declined")
			end
		end
	end


	describe '#deduct' do
		it 'Should deduct money from card for fare' do
		expect(card).to respond_to(:deduct).with(1).argument
		end
		it 'should return 5' do
		card.top_up(10)
		expect(card.deduct(5)).to eq 5
		end
	end

	describe '#touch_in' do
		it 'touches in' do
		card.top_up(0.5)
		card.touch_in("Bank")
		expect(card).to have_attributes(:in_journey => true)
		end
		it 'raise an error when insufficient funds on card' do
			expect{card.touch_in('a')}.to raise_error('insufficient funds')
		end
	end

	describe '#touch_out' do
		it 'touches out' do
		card.top_up(0.5)
		card.touch_in("Bank")
		card.touch_out("Liverpool Street")
		expect(card).to have_attributes(:in_journey => false)
		end
	end

end
