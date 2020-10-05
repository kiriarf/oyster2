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

    it 'raises an error if balance surpasses 90' do
      expect { subject.top_up(100) }.to raise_error "Card limit of #{Oystercard::CARD_LIMIT} exceeded."
    end
  end
  describe "#deduct" do
    it"Deducts money from card balance" do
      subject.top_up(20)
      subject.deduct(10)
      expect(subject.balance).to eq(10)
    end
  end
  describe '#in_journey?' do
    it 'returns false on initialization' do
      expect(subject.in_journey?).to be false
    end
  end
  describe '#touch_in' do
    it 'changes value of in_use to true' do
      subject.touch_in
      expect(subject.in_journey?).to be true
    end
  end
  describe '#touch_out' do
    it 'changes the value of in_use to false' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to be false
    end
  end
end
