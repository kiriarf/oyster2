class Oystercard
  CARD_LIMIT = 90
  FARE = 1
  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(money)
    exceeded?(money) ? exceeded_error : @balance += money
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "Balance too low." if @balance < FARE
    @in_use = true
  end

  def touch_out
    @in_use = false
    deduct(FARE)
  end

  private

  def exceeded?(money)
    ((@balance + money) >= CARD_LIMIT )
  end

  def exceeded_error
    raise "Card limit of #{CARD_LIMIT} exceeded."
  end

  def deduct(fare)
    @balance -= fare
  end
end
