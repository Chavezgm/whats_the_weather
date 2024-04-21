require 'rails_helper'

RSpec.describe MapQuestPoro do
  describe '#initialize' do
    it 'assigns the latitude and longitude' do
      data = {
        latLng: {
          lat: 39.10713,
          lng: -84.50413
        }
      }

      map_quest_poro = MapQuestPoro.new(data)

      expect(map_quest_poro.lat).to eq(39.10713)
      expect(map_quest_poro.lng).to eq(-84.50413)
    end
  end
end
