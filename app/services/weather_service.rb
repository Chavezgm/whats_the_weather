class WeatherService
  def conn
    Faraday.new(url: "http://api.weatherapi.com/v1/")
  end

  def get_current_weather(lat,lon)
    response = conn.get("current.json?key=#{Rails.application.credentials.weather[:key]}&q=#{lat},#{lon}")
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_forecast_daily(lat, lon)
    response = conn.get("forecast.json?key=#{Rails.application.credentials.weather[:key]}&q=#{lat},#{lon}&days=5")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_forecast_hourly(lat, lon)
    response = conn.get("forecast.json?key=#{Rails.application.credentials.weather[:key]}&q=#{lat},#{lon}&days=0")
    JSON.parse(response.body, symbolize_names: true)   
  end
end
