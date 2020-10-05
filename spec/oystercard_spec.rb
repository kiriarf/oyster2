require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'should have balance of 0 on initialization' do
      expect(subject.balance).to eq(0)
    end
  end
  describe '#top_up' do
    it 'adds to the balance of the card' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end
  end
end
