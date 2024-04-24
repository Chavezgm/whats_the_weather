require 'rails_helper'

RSpec.describe RestaurantPoro do
  describe '#initialize' do
    it 'has latitude and longitude' do
      data = {
        businesses: [
          {
            name: "Radicato",
            location: { display_address: ["137 S Main St, Breckenridge, CO 80424"] },
            rating: 4.3,
            review_count: 100
          }
        ]
      }

      restaurant_poro = RestaurantPoro.new(data)

      expect(restaurant_poro).to be_a(RestaurantPoro)
      expect(restaurant_poro.name).to eq("Radicato")
      expect(restaurant_poro.address).to eq("137 S Main St, Breckenridge, CO 80424")
      expect(restaurant_poro.rating).to eq(4.3)
      expect(restaurant_poro.reviews).to eq(100)

    end
  end
end
