class RoadtripSerializer
  def self.serialize_roadtrip(from,to)
    # require 'pry'; binding.pry
    directions_facade = DirectionsFacade.new
    weather_facade = WeatherFacade.new
    mapquest_facade = MapQuestFacade

    travel_time = directions_facade.here_to_there(from, to)

    if travel_time[:error]
      { error: "Impossible", status: 422 }
    else 
      # require 'pry'; binding.pry
      location_lat_lng = MapQuestFacade.get_lat_long(to)
      forecast =  weather_facade.forecast_hourly(location_lat_lng[:lat],location_lat_lng[:lon])
      {
        "data": {
          "id": nil,
          "type": "road_trip",
          "attributes": {
            "start_city": from,
            "end_city": to,
            "travel_time": travel_time[:formatted],
            "weather_at_eta": {
              "datetime": travel_time[:arrival_time], 
              "temperature": forecast[(travel_time[:arrival_time][10..12]).to_i][:temperature],
              #we are accessing the temperature from the forecast based on the time of the arrival
              #(travel_time[:arrival_time][0..1]) this extracts the first 2 characters(which represent the)
              #then we convert these two numbers into an integer that then represent the hour, 
              #forecast[(travel_time[:arrival_time][0..1]).to_i]
              #forecast[(travel_time[:arrival_time][0..1]).to_i] We use this integer as an index to access the corresponding forecast data from the forecast array 
              #it finds the corresponding time and we finally call [:temperature] value from the forecast
              "condition": forecast[(travel_time[:arrival_time][10..12]).to_i][:conditions]
              #same process for to find the conditions but we call conditions instead of temperature
              #I found this by the arrival time we get from grabbing the first 2 characters in the sting and making them integers and then grabbing the conditions from that hash 
            }
          }
        }
      }.to_json
      # require 'pry'; binding.pry
    end

  end
end