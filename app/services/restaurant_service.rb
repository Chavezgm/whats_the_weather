class RestaurantService
  def conn
    Faraday.new(url: "https://api.yelp.com/v3/" )
  end

  def search(lat, lon, cuisine) 
    response = conn.get("businesses/search") do |r|
      r.params['latitude'] = lat
      r.params['longitude'] = lon
      r.params['categories'] = cuisine
      r.params['sort_by'] = 'rating'
      r.params['limit'] = 1
      r.headers['Authorization'] = "Bearer #{Rails.application.credentials.yelp[:key]}"
    end
    JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end