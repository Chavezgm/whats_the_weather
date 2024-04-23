class RestaurantPoro
  attr_reader :name, :address, :rating, :reviews
  def initialize(data)
    attr = data[:businesses].first
    # require 'pry'; binding.pry
    @name = attr[:name]
    @address = attr[:location][:display_address].first
    @rating = attr[:rating]
    @reviews = attr[:review_count]
  end
end