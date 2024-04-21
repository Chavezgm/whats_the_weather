class MapQuestFacade
  def self.get_lat_long(location)
    params = {location: location}
    # require 'pry'; binding.pry
    # require 'pry'; binding.pry
    response = MapQuestService.call_db("/geocoding/v1/address",params)[:results].first[:locations].first[:latLng]
    {
      lat: response[:lat],
      lon: response[:lng]
    }
  end
end