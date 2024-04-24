RSpec.describe RoadtripSerializer do
  describe '#road trip' do
    it 'road trip', :vcr do
      serializer = RoadtripSerializer

      road_trip_response = serializer.serialize_roadtrip("Denver,CO", "New York City,NY")
      parsed_data = JSON.parse(road_trip_response, symbolize_names: true)[:data]

      expect(parsed_data).to be_a(Hash)
      expect(parsed_data[:id]).to eq(nil)
      # require 'pry'; binding.pry
      expect(parsed_data[:type]).to eq('road_trip')
      
      attributes = parsed_data[:attributes]

      expect(attributes[:start_city]).to be_a(String)
      expect(attributes[:end_city]).to be_a(String)
      expect(attributes[:travel_time]).to be_a(String)

      weather =  attributes[:weather_at_eta]

      expect(weather[:datetime]).to be_a(String)
      expect(weather[:temperature]).to be_a(Float)
      expect(weather[:condition]).to be_a(String)
    end
  end
end