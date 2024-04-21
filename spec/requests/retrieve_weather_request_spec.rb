require 'rails_helper'

RSpec.describe 'Retrieve weather for a city', :vcr do
  it "can retrieve weather for a city " do
    headers = {"CONTENT_TYPE": "application/json" , "ACCEPT": "application/json" } 

    get "/api/v0/forecast?location=cincinatti,oh", headers: headers

    expect(response).to be_successful
    require 'pry'; binding.pry
    expect(response.status).to eq(200)
  end

end