require "rails_helper"

RSpec.describe 'POST to road trip', type: :request do
  describe 'POST /api/v0/road_trip' do
    it 'creates a user with valid credentials', :vcr do
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
    
    end
  end
end