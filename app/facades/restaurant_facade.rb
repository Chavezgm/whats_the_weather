class RestaurantFacade
  def search_for_restaurant(lat, lon , cuisine)
    restaurant_s = RestaurantService.new

    response = restaurant_s.search(lat, lon , cuisine)
    # require 'pry'; binding.pry

    restaurant = RestaurantPoro.new(response)

    {
      name: restaurant.name,
      address: restaurant.address,
      rating: restaurant.rating,
      reviews: restaurant.reviews
    }
  end
end
