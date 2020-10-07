class Oystercard
  CARD_LIMIT = 90
  FARE = 1
  attr_reader :balance, :entry_station, :journeys, :journey_class

  def initialize(journey_class = Journey)
    @balance = 0
    @entry_station = nil
    @journeys = []
    @journey_class = journey_class
  end

  def top_up(money)
    exceeded?(money) ? exceeded_error : @balance += money
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "Balance too low." if @balance < @journey_class::FARE
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(@journey_class::FARE)
    create_journey(exit_station)
    @entry_station = nil
  end

  private

  def create_journey(exit_station)
    @journeys << @journey_class.new(@entry_station, exit_station).current_journey
  end

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
