class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You do not have access to that page."
    redirect_to root_path
  end

end
