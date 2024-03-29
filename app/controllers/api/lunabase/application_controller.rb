class Api::Lunabase::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  protect_from_forgery unless: -> { request.format.json? }
  
  # acts_as_token_authentication_handler_for User, fallback_to_devise: false
end
