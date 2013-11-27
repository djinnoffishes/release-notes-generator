class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from JIRA::HTTPError do
    flash[:error] = "Something's not right; probably that fixVersion doesn't exist."
    redirect_to root_path
  end
end
