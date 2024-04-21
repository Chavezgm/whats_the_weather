require "rails_helper"

RSpec.describe 'POST create a user', type: :request do
  describe 'POST /api/v0/users' do
    it 'creates a user with valid credentials', :vcr do
      user_info = {
        "email": "example@example.com",
        "password": "password",
      }

      post '/api/v0/sessions', params: user_info.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      data = JSON.parse(response.body, symbolize_names:true)
      
      # require 'pry'; binding.pry
      expect(data).to be_a(Hash)

      data_parsed = data[:data]

      expect(data_parsed[:type]).to eq('user')
      expect(data_parsed[:type]).to be_a(String)
      expect(data_parsed[:id]).to be_a(String)

      attribute_data = data_parsed[:attributes]

      expect(attribute_data[:email]).to be_a(String)
      expect(attribute_data[:password_digest]).to be_a(String)
      expect(attribute_data[:api_key]).to be_a(String)

      # require 'pry'; binding.pry
    end

    it ' does not create a user with invalid credentials SAD PATH', :vcr do
      user_info = {
        "email": "example8909@example.com",
        "password": "password12",
      }

      post '/api/v0/sessions', params: user_info.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      #422 is an unprocessed entity which means its not creating it
      
      data = JSON.parse(response.body, symbolize_names:true)
      
      # require 'pry'; binding.pry
      expect(data).to be_a(Hash)
      
      expect(data).to have_key(:errors)
      
      expect(data[:errors]).to eq("Email or Passowrd is incorrect!")
      
    end
  end
end
