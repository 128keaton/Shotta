class ViewerController < ApplicationController
  def index
      @screenshot =  Screenshot.find(params[:id])
  end
end
