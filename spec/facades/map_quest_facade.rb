require 'rails_helper'

RSpec.describe MapQuestFacade, :vcr do
  it 'can find by location' do
    location = "Denver, CO"
    result = MapQuestFacade.get_lat_long(location)

    expect(result).to be_a(MapQuestPoro)
    expect(result.lat).to be_a(Float)
    expect(result.lng).to be_a(Float)
  end
end