class MapQuestPoro
  attr_reader :lat, :lng
  
  def initialize(data)
    # require 'pry'; binding.pry
    @lat = data[:latLng][:lat]
    @lng = data[:latLng][:lng]
  end
end
