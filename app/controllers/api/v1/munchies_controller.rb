class Api::V1::MunchiesController < ApplicationController
  def show
    # require 'pry'; binding.pry
    loc = params[:location].split(',')
    cuisine = params[:food]

  end
end