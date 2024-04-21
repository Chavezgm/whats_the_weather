class Api::V0::ForecastController < ApplicationController
  def forecast
    location = MapQuestFacade.get_lat_long(params[:location])

    # weather = WeatherFacade.new.get_weather(location.lat,location.lng)
    render json: WeatherSerializer.new.serialize_weather(location.first,location[1])

  end
end
