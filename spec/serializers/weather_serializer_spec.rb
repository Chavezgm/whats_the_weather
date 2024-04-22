RSpec.describe WeatherSerializer do
  describe '#serialize_weather' do
    it 'serialize_weather', :vcr do
      serializer = WeatherSerializer.new

      weather_response = serializer.serialize_weather(48.8567, 2.3508)
      parsed_data = JSON.parse(weather_response, symbolize_names: true)[:data]
      # require 'pry'; binding.pry
      
      expect(parsed_data).to be_a(Hash)
      expect(parsed_data[:id]).to eq(nil)
      expect(parsed_data[:type]).to be_a(String)

      expect(parsed_data[:attributes]).to be_a(Hash)

      current_weather = parsed_data[:attributes][:current_weather]

      expect(current_weather[:last_updated]).to be_a(String)
      expect(current_weather[:temperature]).to be_a(Float)
      expect(current_weather[:feels_like]).to be_a(Float)
      expect(current_weather[:humidity]).to be_a(Integer)
      expect(current_weather[:uvi]).to be_a(Float)
      expect(current_weather[:visibility]).to be_a(Float)
      expect(current_weather[:condition]).to be_a(String)
      expect(current_weather[:icon]).to be_a(String)

      daily_weather = parsed_data[:attributes][:daily_weather].first

      expect(daily_weather[:date]).to be_a(String)
      expect(daily_weather[:sunrise]).to be_a(String)
      expect(daily_weather[:sunset]).to be_a(String)
      expect(daily_weather[:max_temp]).to be_a(Float)
      expect(daily_weather[:min_temp]).to be_a(Float)
      expect(daily_weather[:condition]).to be_a(String)
      expect(daily_weather[:icon]).to be_a(String)
      
      hourly_data = parsed_data[:attributes][:hourly_weather].first

      expect(hourly_data[:time]).to be_a(String)
      expect(hourly_data[:temperature]).to be_a(Float)
      expect(hourly_data[:conditions]).to be_a(String)
      expect(hourly_data[:icon]).to be_a(String)

    end
  end
end