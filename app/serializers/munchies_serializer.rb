class MunchiesSerializer
  def serialize(loc, cuisine)
    restaurant_facade = RestaurantFacade.new 
    weather = WeatherFacade.new
    map_quest = MapQuestFacade

    coordinates = map_quest.get_lat_long(loc)
    require 'pry'; binding.pry

    {
      "data":{
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": loc,
          "forecast":
        }
      }
    }

  end
end