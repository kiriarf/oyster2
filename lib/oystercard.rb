class Oystercard
  CARD_LIMIT = 90
  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(money)
    raise "Card limit of #{CARD_LIMIT} exceeded." if (@balance + money) >= CARD_LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_use
  end

  def touch_in
    @in_use = true
  end

end
