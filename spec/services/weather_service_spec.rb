require 'rails_helper'

RSpec.describe WeatherService do
  describe '#get_current_weather' do
    it 'returns current weather data', :vcr do
      service = WeatherService.new

      weather = service.get_current_weather(50.9898, 6.8989)
      # require 'pry'; binding.pry
      expect(weather).to be_a(Hash)

      current_data = weather[:current]

      expect(current_data).to be_a(Hash)
      expect(current_data[:last_updated]).to be_a(String)
      expect(current_data[:temp_c]).to be_a(Float)
      expect(current_data[:condition][:text]).to be_a(String)
      expect(current_data[:condition][:icon]).to be_a(String)
      expect(current_data[:humidity]).to be_a(Integer)
      expect(current_data[:vis_miles]).to be_a(Float)
      expect(current_data[:uv]).to be_a(Float)
      expect(current_data[:wind_dir]).to be_a(String)
      
    end
  end

  describe '#get_forecast_daily' do
    it 'returns daily forecast weather data', :vcr do
      service = WeatherService.new

      weather = service.get_forecast_daily(50.9898, 6.8989)
      # require 'pry'; binding.pry
      expect(weather).to be_a(Hash)
      
      
      daily_data = weather[:forecast][:forecastday]

      # require 'pry'; binding.pry

      daily_data.each do |data|
        expect(data[:date]).to be_a(String)
        expect(data[:day][:maxtemp_f]).to be_a(Float)
        expect(data[:day][:mintemp_f]).to be_a(Float)
        expect(data[:day][:condition][:text]).to be_a(String)
        expect(data[:day][:condition][:icon]).to be_a(String)
        expect(data[:astro][:sunrise]).to be_a(String)
        expect(data[:astro][:sunset]).to be_a(String)
        expect(data[:astro][:moon_illumination]).to be_a(Integer)
      end
    end
  end

  describe '#get_forecast_hourly' do
    it 'returns hourly forecast weather data', :vcr do
      service = WeatherService.new

      weather = service.get_forecast_hourly(50.9898, 6.8989)
      # require 'pry'; binding.pry
      expect(weather).to be_a(Hash)
      
      
      hourly_data = weather[:forecast][:forecastday].first[:hour]

      # require 'pry'; binding.pry

      hourly_data.each do |data|
        expect(data[:time]).to be_a(String)
        expect(data[:temp_f]).to be_a(Float)
        expect(data[:condition]).to be_a(Hash)
        expect(data[:condition][:text]).to be_a(String)
        expect(data[:condition][:icon]).to be_a(String)
      end
    end
  end
end