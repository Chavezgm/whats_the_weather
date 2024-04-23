require 'rails_helper'

RSpec.describe 'Munchies' do
  it " returns data for munchies", :vcr do
    headers = {"CONTENT_TYPE": "application/json" , "ACCEPT": "application/json" } 

    get "/api/v1/munchies", params: {location: 'pueblo,co', food: "italian"}
    require 'pry'; binding.pry
    expect(response).to be_successful
    
  end
end

