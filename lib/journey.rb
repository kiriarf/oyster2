class Journey
  FARE = 1
  PENALTY = 6

  attr_reader :current_journey

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @current_journey = {entry: entry_station, exit: exit_station}
  end

  def fare 
    complete? ? PENALTY : FARE
  end

  private
  def complete?
    @entry_station == nil || @exit_station == nil
  end
  
end