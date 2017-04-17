class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_permitted_parameters, if: :devise_controller?

  after_filter :store_location

      def store_location
        # store last url as long as it isn't a /users path
        session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
      end

      def after_sign_in_path_for(resource)
        session[:previous_url] || root_path
      end

    protected

    def configure_devise_permitted_parameters
      permitted_params = [:email, :password, :password_confirmation, :name]

      if params[:action] == 'update'
        devise_parameter_sanitizer.permit(:account_update) {
          |u| u.permit(permitted_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.permit(:sign_up) {
          |u| u.permit(permitted_params)
        }
      end
    end
end
