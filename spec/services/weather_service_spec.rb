require 'rails_helper'

RSpec.describe WeatherService,:vcr do
  xit 'it can successfuly connect to WeatherService' do
    params = {location: "Denver, CO"}
    map_info = WeatherService.call_db("/geocoding/v1/address", params)[:results][0][:locations][0]

    expect(map_info).to be_a(Hash)
    expect(map_info).to have_key(:latLng)
    expect(map_info[:latLng]).to have_key(:lat)
    expect(map_info[:latLng]).to have_key(:lng)
    expect(map_info[:latLng][:lng]).to be_a(Float)
    expect(map_info[:latLng][:lat]).to be_a(Float)
  end
end