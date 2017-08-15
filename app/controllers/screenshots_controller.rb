class ScreenshotsController < ApplicationController
  before_action :authenticate_user!
  def index
    @screenshots = User.find(current_user.id).screenshots
  end

  def upload
    if user = User.find(current_user.id)
      
    if(params.has_key?(:user))
      user.screenshots += params[:user][:screenshots]
      user.save!
      render json: params
    else
      screenshots = user.screenshots
      screenshots << params[:file]
      user.update(screenshots: screenshots)
      user.save!
    end
  end
end
end
