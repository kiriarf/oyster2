class Journey
  FARE = 1
  PENALTY = 6

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def fare 
    complete? ? calculate_fare : PENALTY
  end

  def complete?
    @entry_station && @exit_station
  end

  def calculate_fare
    zone_difference == 0 ? FARE : FARE + zone_difference
  end

  def zone_difference
    (@entry_station.zone - @exit_station.zone).abs
  end
end