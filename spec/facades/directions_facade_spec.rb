require 'rails_helper'

RSpec.describe DirectionsFacade do
  describe '#here_to_to_there' do
    it 'returns the time for a trip', :vcr do
      facade = DirectionsFacade.new
      response = facade.here_to_there("Denver,CO", "New York City,NY")

      expect(response).to be_a(Hash)
      expect(response).to have_key(:arrival_time)
      expect(response[:arrival_time]).to be_a(String)
      expect(response[:formatted]).to be_a(String)
    end
  end
end
  