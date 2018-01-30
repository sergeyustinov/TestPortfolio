class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  # emulate devise current_user, now selecting random user
  def current_user
    @current_user ||= User.order("RANDOM()").first
  end
end
