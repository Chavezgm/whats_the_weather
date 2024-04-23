require 'rails_helper'

RSpec.describe RestaurantFacade do
  describe '#here_to_to_there' do
    it 'returns the time for a trip', :vcr do
      facade = RestaurantFacade.new
      response = facade.search_fo_restaurant(39.74001, -105.99202, 'italian')

      expect(response).to be_a(Hash)
      # require 'pry'; binding.pry
      expect(response).to have_key(:name)
      expect(response[:name]).to be_a(String)

      expect(response).to have_key(:address)
      expect(response[:address]).to be_a(String)

      expect(response).to have_key(:rating)
      expect(response[:rating]).to be_a(Float)

      expect(response).to have_key(:reviews)
      expect(response[:reviews]).to be_a(Integer)



      
    end
  end
end