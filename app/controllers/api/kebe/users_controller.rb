class Api::Kebe::UsersController < Api::Kebe::ApplicationController
  # protect_from_forgery with: :null_session

  def create
    if User.where(email: params[:user][:email]).exists?
      render json: { message: "Account already exist" }, status: :conflict
      return
    end

    @user = User.new(user_params)
    if @user.save
      render :create
    else
      render json: { message: @user.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end



  private

  def user_params
      params.require(:user).permit(:email, :password, :name)
  end

end
