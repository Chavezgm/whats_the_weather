class DirectionsFacade
  def here_to_there(here, there)
    service = DirectionsService.new
    response = service.get_location_a_to_location_b(here, there)
    # require 'pry'; binding.pry
    if response[:route][:routeError]
      { error: 'Impossible' }
    else
      {
        arrival_time: calculate_arrival_time(response[:route][:time]),
        formatted: response[:route][:formattedTime]
      }
    end
  end
    
  private

  def calculate_arrival_time(total_seconds)
    arrival_time = Time.now + total_seconds
    arrival_time.strftime('%Y-%m-%d %H:%M')
  end
end
