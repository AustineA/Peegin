class Api::Kebe::SessionsController < Api::Kebe::ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  protect_from_forgery with: :null_session

  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
        render :create, status: :created
    else
        render json: { message: "Invalid email or password"}, status: :not_found
    end

  end

  def destroy
    #  current_user = User.where(email: params[:email]).first

    # email = unless request.headers['X-User-Email'].nil?
    #   request.headers['X-User-Email']
    # end

    # current_user = User.find_by_email email

    # if current_user.update!(authentication_token:  nil)
    #   head(:ok)
    # else
    #   head(:unauthorized)
    # end
  end

end
