class BookService
  def get_location(citystate)
    info = get_url("/search.json?q=#{citystate}&limit=5")
    # require 'pry'; binding.pry
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://openlibrary.org") do |faraday|
      faraday.params[:key] = Rails.application.credentials.mapquest[:key]
    end
  end
end