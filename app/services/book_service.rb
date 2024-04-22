
class BookService
  def get_book(title, quantity)
    info = get_url("/search.json?q=#{title}&limit=#{quantity}")
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