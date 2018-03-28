class Api::Kebe::UsersController < Api::Kebe::ApplicationController
  protect_from_forgery with: :null_session

  def create
      @user = User.new(user_params)
      if @user.save
        render :create
      else
        head(:unprocessable_entity)
      end
  end



  private

  def user_params
      params.require(:user).permit(:email, :password, :name)
  end

end
