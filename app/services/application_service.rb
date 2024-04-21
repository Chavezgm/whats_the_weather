class ApplicationService
  private

  def self.connection(url)
    Faraday.new(url)
  end

  def self.parse_data(data)
    JSON.parse(data.body, symbolize_names: true)
  end
end