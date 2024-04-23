require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#weather current' do
    it 'returns current weather', :vcr do
      facade = WeatherFacade.new
      response = facade.weather_current(67.990, 3.5689)

      # require 'pry'; binding.pry
      expect(response).to be_a(Hash)
      expect(response[:last_updated]).to be_a(String)
      expect(response[:temperature]).to be_a(Float)
      expect(response[:feels_like]).to be_a(Float)
      expect(response[:humidity]).to be_a(Integer)
      expect(response[:uvi]).to be_a(Float)
      expect(response[:visibility]).to be_a(Float)
      expect(response[:condition]).to be_a(String)
      expect(response[:icon]).to be_a(String)
    end
  end

  describe '#forecast_daily' do
    it 'returns daily forecast', :vcr do
      facade = WeatherFacade.new
      response = facade.forecast_daily(67.990, 3.5689)

      # require 'pry'; binding.pry
      expect(response).to be_a(Array)
      response.each do |data|
        # require 'pry'; binding.pry
        expect(data[:date]).to be_a(String)
        expect(data[:sunrise]).to be_a(String)
        expect(data[:sunset]).to be_a(String)
        expect(data[:max_temp]).to be_a(Float)
        expect(data[:min_temp]).to be_a(Float)
        expect(data[:condition]).to be_a(String)
        expect(data[:icon]).to be_a(String)
      end
      
    end
  end
  
  describe '#forecast_hourly' do
    it 'returns hourly forecast', :vcr do
      facade = WeatherFacade.new
      response = facade.forecast_hourly(67.990, 3.5689)

      expect(response).to be_a(Array)
      response.each do |data|
        expect(data[:time]).to be_a(String)
        expect(data[:temperature]).to be_a(Float)
        expect(data[:conditions]).to be_a(String)
        expect(data[:icon]).to be_a(String)
      end
    end
  end

  describe '# Muchies weather current' do
    it 'returns current weather for muchies', :vcr do
      facade = WeatherFacade.new
      response = facade.munchies_weather_current(67.990, 3.5689)

      # require 'pry'; binding.pry
      expect(response).to be_a(Hash)

      expect(response[:temperature]).to be_a(Float)
      expect(response[:summary]).to be_a(String)
      
    end
  end
end
  