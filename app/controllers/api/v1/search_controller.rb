class Api::V1::SearchController < ApplicationController

  def search_books
    destination = params[:location].split(',')
    cuisine = params[:food]
    require 'pry'; binding.pry
  end

end 