require 'rails_helper'

RSpec.describe 'Munchies' do
  it " returns data for munchies", :vcr do
    headers = {"CONTENT_TYPE": "application/json" , "ACCEPT": "application/json" } 

    get "/api/v1/munchies", params: {location: 'pueblo,co', food: "italian"}

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names:true)[:data]
    
    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)

    expect(data).to have_key(:type)
    expect(data[:type]).to be_a(String)

    attributes = data[:attributes]

    expect(attributes).to have_key(:destination_city)
    expect(attributes[:destination_city]).to be_a(String)

    expect(attributes[:forecast]).to be_a(Hash)
    expect(attributes[:forecast][:summary]).to be_a(String)
    expect(attributes[:forecast][:temperature]).to be_a(Float)

    expect(attributes[:restaurant]).to be_a(Hash)
    expect(attributes[:restaurant][:name]).to be_a(String)
    expect(attributes[:restaurant][:address]).to be_a(String)
    expect(attributes[:restaurant][:rating]).to be_a(Float)
    expect(attributes[:restaurant][:reviews]).to be_a(Integer)
  end
end

