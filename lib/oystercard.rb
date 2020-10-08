class Oystercard
  CARD_LIMIT = 90
  attr_reader :balance, :journey_log 

  def initialize(journey_log = JourneyLog.new(Journey, self))
    @balance = 0
    @journey_log = journey_log
    # @entry_station = nil
    # @journeys = []
    # @journey_class = journey_class
  end

  def top_up(money)
    exceeded?(money) ? exceeded_error : @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(station)
    raise "Balance too low." if @balance < Journey::FARE
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
  end

  private
  def exceeded?(money)
    ((@balance + money) >= CARD_LIMIT )
  end

  def exceeded_error
    raise "Card limit of #{CARD_LIMIT} exceeded."
  end
end
