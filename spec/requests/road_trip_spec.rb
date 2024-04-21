require "rails_helper"

RSpec.describe 'POST to road trip', type: :request do
  describe 'POST /api/v0/road_trip' do
    it 'creates a road trip with valid credentials', :vcr do
      user_info = {
        "email": "example@example.com",
        "password": "password"
      }
      # require 'pry'; binding.pry

      road_trip_info = {
        "origin": "Cincinatti,OH",
        "destination": "Chicago,IL",
        "api_key": "7312761e57261286691b8a035bda1927"
      }
      


      post '/api/v0/road_trip', params:road_trip_info.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      expect(response).to be_successful
      # require 'pry'; binding.pry
      expect(response.status).to eq(200)
      
      data = JSON.parse(response.body, symbolize_names:true)

      expect(data).to be_a(Hash)

      expect(data[:data][:id]).to eq(nil)
      expect(data[:data][:type]).to eq('road_trip')
      # require 'pry'; binding.pry
      
      attributes = data[:data][:attributes]


      expect(attributes[:start_city]).to be_a(String)
      expect(attributes[:end_city]).to be_a(String)
      expect(attributes[:travel_time]).to be_a(String)

      weather_data = data[:data][:attributes][:weather_at_eta]

      expect(weather_data).to be_a(Hash)
      expect(weather_data[:datetime]).to be_a(String)
      expect(weather_data[:temperature]).to be_a(Float)
      expect(weather_data[:condition]).to be_a(String)
    end

    it 'creates DOES NOT create a road trip with wrong or no api key ', :vcr do
      user_info = {
        "email": "example@example.com",
        "password": "password"
      }
      # require 'pry'; binding.pry

      road_trip_info = {
        "origin": "Cincinatti,OH",
        "destination": "Chicago,IL",
        "api_key": ""
      }
      

      post '/api/v0/road_trip', params:road_trip_info.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      
      expect(response).to_not be_successful
      expect(response.status).to eq(401) #if no api key is given 401 code 
      # require 'pry'; binding.pry

      data = JSON.parse(response.body, symbolize_names:true)
      
      expect(data).to be_a(Hash)
      expect(data).to have_key(:errors)
      expect(data[:errors]).to eq("Invalid api ket, try again!!!")
    end

    it ' creates DOES NOT create a road trip with wrong or no api key', :vcr do
      user_info = {
        "email": "example@example.com",
        "password": "password"
      }
      # require 'pry'; binding.pry

      road_trip_info = {
        "origin": "Cincinatti,OH",
        "destination": "London,UK",
        "api_key": "7312761e57261286691b8a035bda1927"
      }
      

      post '/api/v0/road_trip', params:road_trip_info.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      
      expect(response).to_not be_successful
      # require 'pry'; binding.pry
      expect(response.status).to eq(406)

      data = JSON.parse(response.body, symbolize_names:true)
      # require 'pry'; binding.pry
      expect(data).to be_a(Hash)
      expect(data).to have_key(:errors)
      expect(data[:errors]).to eq("Impossible")
    end
  end
end