require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
  	it { is_expected.to respond_to(:top_up).with(1).argument }
  end
  	it 'raises an error if maximum balance is exceeded' do
  		maximum_balance = Oystercard::MAXIMUM_BALANCE
  		subject.top_up(maximum_balance)
  		expect{ subject.top_up 1 }.to raise_error 'Maximum balance of #{MAXIMUM_BALANCE} exceeded'
  	end

  	it { is_expected.to respond_to(:deduct).with(1).argument }

  	it 'deducts an amount from the balance' do
  		subject.top_up(20)
  		expect{ subject.deduct 3}.to change{ subject.balance }.by -3
  	end		
end