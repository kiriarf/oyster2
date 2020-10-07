class JourneyLog
  attr_reader :journeys

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = nil
  end

  def start_journey(station)
    @current_journey = @journey_class.new
    @current_journey.start(station)
  end

  def finish_journey(station)
    @current_journey.finish(station)
    @journeys << @current_journey
  end
end