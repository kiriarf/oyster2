require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'should have balance of 0 on initialization' do
      expect(subject.balance).to eq(0)
    end
  end
end
