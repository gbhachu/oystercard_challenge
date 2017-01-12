require 'oystercard'

describe Oystercard do
subject(:card){ described_class.new}
let(:entry_station) {double :station}
let(:exit_station) {double :station}

	describe 'New instance' do
		it 'should have a balance of 0' do
			expect(card).to have_attributes(:balance => 0)
		end
		it 'should have no journeys' do
			expect(card.journey).to eq({})
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

	describe '#touch_in' do

		it 'touches in' do
			card.top_up(2)
			card.touch_in(entry_station)
			expect(card).to have_attributes(:in_journey => true)
		end
		it 'raise an error when insufficient funds on card' do
			expect{card.touch_in(entry_station)}.to raise_error('insufficient funds')
		end
		it 'remembers entry station' do
			card.top_up(2)
			expect(card.touch_in(entry_station)).to eq entry_station
		end
	end

	describe '#touch_out' do
		before(:each) do
		    @card = card.top_up(2)
		    @card = card.touch_in(entry_station)
		 end

		it 'touches out' do
			card.touch_out(exit_station)
			expect(card).to have_attributes(:in_journey => false)
		end
		it 'touches out deducts amount' do
			expect {card.touch_out(exit_station)}.to change{card.balance}.by(-1)
		end
		it 'touches out will save journey on card' do
			card.touch_out(exit_station)
			expect(card).to have_attributes(:entry_station => entry_station)
		end
		it 'stores exit station' do
			card.touch_in(entry_station)
			card.touch_out(exit_station)
			expect(card.exit_station).to eq exit_station
		end
		it 'stores journey' do
			card.touch_in(entry_station)
			card.touch_out(exit_station)
			expect(card.journey).to eq({entry_station => exit_station})
		end
	end



end
