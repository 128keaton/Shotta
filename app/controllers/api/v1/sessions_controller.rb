module Api
  module V1
      class SessionsController < Api::V1::BaseController
          def create
              resource = User.find_for_database_authentication(:email => params[:user_login][:email])
              resource ||= User.new
          
              if resource.valid_password?(params[:user_login][:password])
                resource.regenerate_auth_token
                render json: { auth_token: resource.auth_token }
              else
                invalid_login_attempt
              end
          end
          
          def destroy
              if resource = User.find_by(auth_token: get_auth_token)
                resource.invalidate_auth_token
                render json: { 'status': 'logged out'}
              end
          end

        def get_auth_token
            request.headers['X-AUTH-TOKEN']
        end
          
          private
              def invalid_login_attempt
                  render json: {errors: [{detail: "The provided username and/or password is invalid."}]}, status: 401
              end
      end
  end
end