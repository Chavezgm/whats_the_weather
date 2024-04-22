require 'rails_helper'

RSpec.describe 'Retrieve books', :vcr do
  it "can retrieve books " do
    headers = {"CONTENT_TYPE": "application/json" , "ACCEPT": "application/json" } 

    get "/api/v1/book-search?location=denver,co&quantity=5", headers: headers

    require 'pry'; binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(200)
    data = JSON.parse(response.body, symbolize_names:true)[:data]

    expect(data).to be_a(Hash)
    expect(data[:id]).to be(nil)
    # require 'pry'; binding.pry
    expect(data[:type]).to eq("forecast")

    attributes = data[:attributes]
    # require 'pry'; binding.pry
    expect(attributes).to be_a(Hash)

    data_current = attributes[:current_weather]

    # Current weather section test here 
  end
end 