class Api::V0::RoadTripsController < ApplicationController
  def create
    # require 'pry'; binding.pry
    user = User.find_by(api_key: roadtrip_params[:api_key])
    if user 
      road_trip = RoadtripSerializer.serialize_roadtrip(roadtrip_params[:origin], roadtrip_params[:destination])
      # require 'pry'; binding.pry
      if road_trip.is_a?(Hash) && road_trip[:error].present?
        render json: {errors: "Impossible"}, status: :not_acceptable
      else 
        render json: road_trip
      end

    else 
      render json: { errors: 'Invalid api key, try again!!!'} , status: :unauthorized
    end
  end

  private 
  def roadtrip_params
    payload = JSON.parse(request.body.read, symbolize_names: true)
    ActionController::Parameters.new(payload).permit(:origin, :destination, :api_key)
  end
end

