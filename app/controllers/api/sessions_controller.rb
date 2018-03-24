class Api::SessionsController < Api::ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def create
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
        render json: user.as_json(only: [:email,:authentication_token]), status: :created
    else
        head(:unauthorized)
    end

  end

  def destroy

  end

end
