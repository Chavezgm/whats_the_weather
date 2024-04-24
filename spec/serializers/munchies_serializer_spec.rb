require 'rails_helper'
RSpec.describe MunchiesSerializer do
  describe '#get_location_a_to_location_b' do
    it 'returns directions', :vcr do
      serializer = MunchiesSerializer.new

      munchies_response = serializer.serialize("Denver,CO", "italian")
      parsed_data = JSON.parse(munchies_response, symbolize_names: true)[:data]
      
      # require 'pry'; binding.pry
      
      expect(parsed_data).to be_a(Hash)
      expect(parsed_data[:id]).to be(nil)

      expect(parsed_data[:type]).to be_a(String)
      expect(parsed_data).to have_key(:attributes)

      attributes = parsed_data[:attributes]

      expect(attributes).to have_key(:destination_city)
      expect(attributes[:destination_city]).to be_a(String)

      expect(attributes[:forecast]).to be_a(Hash)
      expect(attributes[:forecast][:summary]).to be_a(String)
      expect(attributes[:forecast][:temperature]).to be_a(Float)

      expect(attributes[:restaurant]).to be_a(Hash)
      expect(attributes[:restaurant][:name]).to be_a(String)
      expect(attributes[:restaurant][:address]).to be_a(String)
      expect(attributes[:restaurant][:rating]).to be_a(Float)
      expect(attributes[:restaurant][:reviews]).to be_a(Integer)
    end
  end
end