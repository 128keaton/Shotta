# frozen_string_literal: true

module Api
  module V1
    class ApiController < Api::V1::BaseController
      protect_from_forgery except: %i[upload delete create]
      def show
        if current_user = User.find_by(auth_token: get_auth_token)
          @screenshots = current_user.screenshots.all
          render json: @screenshots
        else
          render json: { errors: [{ detail: 'Access denied' }] }, status: 401
         end
      end

      def upload
        if current_user = User.find_by(auth_token: get_auth_token)
          puts params[:file]
          screenshot = current_user.screenshots.create(image: params[:file])
          screenshot.save!
        else
          render json: { errors: [{ detail: 'Access denied' }] }, status: 401
        end
      end

      def get_auth_token
        request.headers['X-AUTH-TOKEN']
      end
    end
  end
end
