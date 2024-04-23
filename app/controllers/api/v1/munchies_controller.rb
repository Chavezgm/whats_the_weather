class Api::V1::MunchiesController < ApplicationController
  def show
    # require 'pry'; binding.pry
    loc = params[:location]
    cuisine = params[:food]

    render json: MunchiesSerializer.new.serialize(loc, cuisine)
  end
end