
class Journey

attr_reader :entry_station, :end_station

def initialize(entry_station)
  @entry_station = entry_station

end

def end_journey(end_station)
  @end_station = end_station
end




#def end station
#    @end_station = end_station.name
#    @in_journey = false
#    calculate_fare
#  end

#  def calculate_fare
#    @start_station ? MINIMUM_FARE : DEFAULT_PENALTY
#  end/

end
