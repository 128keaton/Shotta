class ScreenshotsController < ApplicationController
  before_action :authenticate_user!
  def index
    puts User.find(current_user.id).screenshots
    @screenshots = User.find(current_user.id).screenshots.order! 'created_at DESC'
   
  end

  def upload
    if user = User.find(current_user.id)
      puts params[:file]
      screenshot = user.screenshots.create(image: params[:file])
      screenshot.save!
    end
end
end
