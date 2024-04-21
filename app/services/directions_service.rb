class DirectionsService
  def get_location_a_to_location_b(a, b)
    info = get_url("/directions/v2/route?&from=#{a}&to=#{b}")
    # require 'pry'; binding.pry
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.params[:key] = Rails.application.credentials.mapquest[:key]
    end
  end
end