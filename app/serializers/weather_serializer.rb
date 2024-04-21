class WeatherSerializer
  def serialize_weather(lat, lon)
    # require 'pry'; binding.pry
    facade = WeatherFacade.new
    # require 'pry'; binding.pry
    {
      "data": {
        "id": nil,
        "type": "forecast",
        "attributes": {
          "current_weather": facade.weather_current(lat, lon),
          "daily_weather": facade.forecast_daily(lat, lon),
          "hourly_weather": facade.forecast_hourly(lat, lon)
        }
      }
    }.to_json
  end
end
