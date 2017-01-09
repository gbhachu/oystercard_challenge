require 'oystercard'

describe Oystercard do

	it 'should have a balance of 0' do
		expect(subject).to have_attributes(:balance =>0)
	end

	/it 'should have a balance of 20' do
		expect(Oystercard.new(20)).to have_attributes(:amount =>20)
	end/

end



