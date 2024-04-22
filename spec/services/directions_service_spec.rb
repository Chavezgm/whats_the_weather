RSpec.describe DirectionsService do
  describe '#get_location_a_to_location_b' do
    it 'returns directions', :vcr do
      service = DirectionsService.new

      directions = service.get_location_a_to_location_b("Denver,CO", "New York City,NY")
      # require 'pry'; binding.pry
      expect(directions).to be_a(Hash)

      directions_data = directions[:route]

      expect(directions_data).to be_a(Hash)
      expect(directions_data[:distance]).to be_a(Float)
      expect(directions_data[:time]).to be_a(Integer)
      expect(directions_data[:formattedTime]).to be_a(String)
      
      direction_legs = directions_data[:legs].first
      
      expect(direction_legs[:distance]).to be_a(Float)
      expect(direction_legs[:time]).to be_a(Integer)


      direction_maneuvers = direction_legs[:maneuvers].first

      expect(direction_maneuvers[:distance]).to be_a(Float)
      expect(direction_maneuvers[:direction]).to be_a(Integer)
      expect(direction_maneuvers[:startPoint][:lat]).to be_a(Float)
      expect(direction_maneuvers[:startPoint][:lng]).to be_a(Float)
      
    end
  end
end