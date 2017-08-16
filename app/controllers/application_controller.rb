class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :detect_browser
  def detect_browser
    case request.user_agent
    when /iPhone/i
      request.variant = :phone
      request.format = :json unless request.path.include?(Devise.mappings[:user].fullpath) || user_signed_in?
    else
      request.variant = :desktop
    end
  end
end
