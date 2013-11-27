class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate

  rescue_from JIRA::HTTPError do
    flash[:error] = "Something's not right; probably that fixVersion doesn't exist."
    redirect_to root_path
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "pmo" && password == "lumberbeard"
    end
  end

end
