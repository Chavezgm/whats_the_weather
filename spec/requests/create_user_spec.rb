require "rails_helper"

RSpec.describe 'POST create a user', type: :request do
  describe 'POST /api/v0/users' do
    it 'creates a user with valid credentials', :vcr do
      user_info = {
        "email": "example767667@example.com",
        "password": "password1234",
        "password_confirmation": "password1234"
      }

      post '/api/v0/users', params: user_info.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      expect(response).to be_successful
      expect(response.status).to eq(201)

      data = JSON.parse(response.body, symbolize_names:true)

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

    it ' does not create a user with invalid credentials', :vcr do
      user_info = {
        "email": "example8909@example.com",
        "password": "password12",
        "password_confirmation": "password127"
      }

      post '/api/v0/users', params: user_info.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      #422 is an unprocessed entity which means its not creating it

      data = JSON.parse(response.body, symbolize_names:true)

      expect(data).to be_a(Hash)

      expect(data).to have_key(:errors)

      expect(data[:errors]).to be_a(Hash)

      expect(data[:errors][:password_confirmation]).to be_a(Array)
      expect(data[:errors][:password_confirmation].first).to eq("doesn't match Password")
    end
  end
end
