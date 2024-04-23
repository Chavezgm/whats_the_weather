class WeatherFacade
  def weather_current(lat, lon)
    service = WeatherService.new
    # require 'pry'; binding.pry -------!!!
    weather_response = service.get_current_weather(lat,lon)[:current]
   #we are organizing what we want when we call for the current weather.
   #we are gettin the lat and long when we call it our serializer  
  #  require 'pry'; binding.pry
    { 
      last_updated: weather_response[:last_updated],
      temperature: weather_response[:temp_f],
      feels_like: weather_response[:feelslike_f],
      humidity: weather_response[:humidity],
      uvi: weather_response[:uv],
      visibility: weather_response[:vis_miles],
      condition: weather_response[:condition][:text],
      icon: weather_response[:condition][:icon]
    }
    #will give the last lines
  end

  def forecast_daily(lat,lon)
    service = WeatherService.new
    forecast_response = service.get_forecast_daily(lat, lon)[:forecast][:forecastday]
    # require 'pry'; binding.pry
    forecast_response.map do |data|
      {
        date: data[:date],
        sunrise: data[:astro][:sunrise],
        sunset: data[:astro][:sunset],
        max_temp: data[:day][:maxtemp_f],
        min_temp: data[:day][:mintemp_f],
        condition: data[:day][:condition][:text],
        icon: data[:day][:condition][:icon]
      }
    end
    # require 'pry'; binding.pry
  end

  def forecast_hourly(lat, lon)
    service = WeatherService.new
    forecast_response = service.get_forecast_hourly(lat, lon)[:forecast][:forecastday].first[:hour]
    # require 'pry'; binding.pry
    forecast_response.map do |data|
      {
        time: data[:time].split(' ')[1], #have to take the date out of the time!!! 
        temperature: data[:temp_f],
        conditions: data[:condition][:text],
        icon: data[:condition][:icon]
      }
    end
    # require 'pry'; binding.pry
  end

  def munchies_weather_current(lat, lon)
    service = WeatherService.new
    weather_response = service.get_current_weather(lat,lon)[:current]
    { 
      summary: weather_response[:condition][:text],
      temperature: weather_response[:temp_f],
    }
    #will give the last lines
  end

end