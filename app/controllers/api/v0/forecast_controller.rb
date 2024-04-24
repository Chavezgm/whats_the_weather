class Api::V0::ForecastController < ApplicationController
  # def forecast
  #   location = MapQuestFacade.get_lat_long(params[:location])
    
  #   # weather = WeatherFacade.new.get_weather(location.lat,location.lng)
  #   render json: WeatherSerializer.new.serialize_weather(location.first,location[1])

  # end

  def forecast
    location = MapQuestFacade.get_lat_long(params[:location])
    weather_facade = WeatherFacade.new
  
    current_weather = weather_facade.weather_current(location[:lat], location[:lon])
    daily_weather = weather_facade.forecast_daily(location[:lat], location[:lon])
    hourly_weather = weather_facade.forecast_hourly(location[:lat], location[:lon])
  
    render json: WeatherSerializer.new.serialize_weather(
      current_weather: current_weather,
      daily_weather: daily_weather,
      hourly_weather: hourly_weather
    )
  end
end
