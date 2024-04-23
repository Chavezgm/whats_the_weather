require "rails_helper"

RSpec.describe RestaurantService do
  describe '#search' do
    it 'returns restaurant info', :vcr do
      service = RestaurantService.new

      response_info = service.search(39.74001, -105.99202, 'italian')
      # require 'pry'; binding.pry
      expect(response_info).to be_a(Hash)

      restaurant_info = response_info[:businesses]

      restaurant_attr = restaurant_info.first
      
      
      expect(restaurant_attr[:name]).to be_a(String)

      expect(restaurant_attr[:alias]).to be_a(String)

      expect(restaurant_attr[:url]).to be_a(String)

      expect(restaurant_attr[:review_count]).to be_a(Integer)

      expect(restaurant_attr[:rating]).to be_a(Float)

      expect(restaurant_attr[:coordinates]).to be_a(Hash)

      expect(restaurant_attr[:coordinates][:latitude]).to be_a(Float)
      expect(restaurant_attr[:coordinates][:longitude]).to be_a(Float)

      expect(restaurant_attr[:location]).to be_a(Hash)

      expect(restaurant_attr[:location][:display_address].first).to be_a(String)


      
    end
  end
end