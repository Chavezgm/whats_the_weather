RSpec.describe WeatherSerializer do
  # describe '#serialize_weather' do
  #   xit 'serialize_weather', :vcr do
  #     serializer = WeatherSerializer.new

  #     weather_response = serializer.serialize_weather(48.8567, 2.3508)
  #     parsed_data = JSON.parse(weather_response, symbolize_names: true)[:data]
  #     # require 'pry'; binding.pry
      
  #     expect(parsed_data).to be_a(Hash)
  #     expect(parsed_data[:id]).to eq(nil)
  #     expect(parsed_data[:type]).to be_a(String)

  #     expect(parsed_data[:attributes]).to be_a(Hash)

  #     current_weather = parsed_data[:attributes][:current_weather]

  #     expect(current_weather[:last_updated]).to be_a(String)
  #     expect(current_weather[:temperature]).to be_a(Float)
  #     expect(current_weather[:feels_like]).to be_a(Float)
  #     expect(current_weather[:humidity]).to be_a(Integer)
  #     expect(current_weather[:uvi]).to be_a(Float)
  #     expect(current_weather[:visibility]).to be_a(Float)
  #     expect(current_weather[:condition]).to be_a(String)
  #     expect(current_weather[:icon]).to be_a(String)

  #     daily_weather = parsed_data[:attributes][:daily_weather].first

  #     expect(daily_weather[:date]).to be_a(String)
  #     expect(daily_weather[:sunrise]).to be_a(String)
  #     expect(daily_weather[:sunset]).to be_a(String)
  #     expect(daily_weather[:max_temp]).to be_a(Float)
  #     expect(daily_weather[:min_temp]).to be_a(Float)
  #     expect(daily_weather[:condition]).to be_a(String)
  #     expect(daily_weather[:icon]).to be_a(String)
      
  #     hourly_data = parsed_data[:attributes][:hourly_weather].first

  #     expect(hourly_data[:time]).to be_a(String)
  #     expect(hourly_data[:temperature]).to be_a(Float)
  #     expect(hourly_data[:conditions]).to be_a(String)
  #     expect(hourly_data[:icon]).to be_a(String)

  #   end
  # end

  it 'serializes forecast data into the expected JSON format' do
    # Sample forecast data
    current_weather = {
      last_updated: "2024-04-23 20:30",
      temperature: 60.1,
      feels_like: 60.1,
      humidity: 57,
      uvi: 3.0,
      visibility: 9.0,
      condition: "Overcast",
      icon: "//cdn.weatherapi.com/weather/64x64/night/122.png"
    }

    daily_weather = [
      {
        date: "2024-04-23",
        sunrise: "06:49 AM",
        sunset: "08:23 PM",
        max_temp: 66.1,
        min_temp: 43.4,
        condition: "Moderate rain",
        icon: "//cdn.weatherapi.com/weather/64x64/day/302.png"
      },
      
    ]

    hourly_weather = [
      {
        time: "00:00",
        temperature: 47.0,
        conditions: "Cloudy",
        icon: "//cdn.weatherapi.com/weather/64x64/night/119.png"
      },
    ]

    # Invoke the Serializer
    serialized_weather = WeatherSerializer.new.serialize_weather(
      current_weather: current_weather,
      daily_weather: daily_weather,
      hourly_weather: hourly_weather
    )
    # require 'pry'; binding.pry

    response = JSON.parse(serialized_weather, symbolize_names: true)[:data]

    # require 'pry'; binding.pry
    expect(response[:id]).to eq(nil)

    expect(response[:type]).to be_a(String)

    expect(response[:attributes]).to be_a(Hash)

    response_attr = response[:attributes][:current_weather]

    expect(response_attr[:last_updated]).to be_a(String)
    expect(response_attr[:temperature]).to be_a(Float)
    expect(response_attr[:feels_like]).to be_a(Float)
    expect(response_attr[:humidity]).to be_a(Integer)
    expect(response_attr[:uvi]).to be_a(Float)

    expect(response_attr[:condition]).to be_a(String)

    expect(response_attr[:icon]).to be_a(String)

    weather = response[:attributes][:daily_weather].first

    expect(weather).to be_a(Hash)
    expect(weather[:date]).to be_a(String)
    expect(weather[:sunrise]).to be_a(String)
    expect(weather[:sunset]).to be_a(String)
    expect(weather[:max_temp]).to be_a(Float)
    expect(weather[:min_temp]).to be_a(Float)
    expect(weather[:condition]).to be_a(String)
    expect(weather[:icon]).to be_a(String)

    hourly = response[:attributes][:hourly_weather].first

    expect(hourly[:time]).to be_a(String)
    expect(hourly[:temperature]).to be_a(Float)
    expect(hourly[:conditions]).to be_a(String)
    expect(hourly[:icon]).to be_a(String)
  end 
end