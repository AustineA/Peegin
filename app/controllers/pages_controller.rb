class PagesController < ApplicationController
  before_action :agent_smith

  def agent_smith
      @browser = Browser.new(request.headers['User-Agent'])

      @droid = request.user_agent.include?("AndroidApp")
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
