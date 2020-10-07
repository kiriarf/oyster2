class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end
 
  # def create_journey(entry_station, exit_station)
  #   @journeys << @journey_class.new(entry_station, exit_station)
  # end

  def start(entry_station)
    @journey_class.new(entry_station)
  end

  def finish(exit_station)
    
  end
end