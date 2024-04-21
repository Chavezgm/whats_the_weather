class Api::V0::UsersController < ApplicationController
  def create
    # require 'pry'; binding.pry
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    payload = JSON.parse(request.body.read, symbolize_names: true)
    ActionController::Parameters.new(payload).permit(:email, :password, :password_confirmation)
  end
  #line 17 This is a security feature in Rails that helps prevent mass assignment vulnerabilities by specifying which parameters are permitted to be updated in the database.
  #very important part for the security side of things  
end
