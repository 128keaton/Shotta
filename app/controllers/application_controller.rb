class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  respond_to :html
end
