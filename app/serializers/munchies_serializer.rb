class MunchiesSerializer
  def serialize(loc, cuisine)
    restaurant_facade = RestaurantFacade.new 
    weather = WeatherFacade.new
    map_quest = MapQuestFacade

    coordinates = map_quest.get_lat_long(loc)
    {
      "data":{
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": loc,
          "forecast": weather.munchies_weather_current(coordinates[:lat], coordinates[:lon]),
          "restaurant": restaurant_facade.search_for_restaurant(coordinates[:lat], coordinates[:lon], cuisine)
        }
      }
    }.to_json

  end
end