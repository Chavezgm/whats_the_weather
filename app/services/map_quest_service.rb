class MapQuestService < ApplicationService
  def self.call_db(path, params = {})
    response = connection('https://www.mapquestapi.com').get(path) do |req| 
      req.params = params
      req.params[:key] = Rails.application.credentials.mapquest[:key]
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'
    end
    parse_data(response)
  end
end
