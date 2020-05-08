class ApplicationController < ActionController::Base
  include Response

  before_action :authenticate, except: :login

  protected

    def authenticate
      authentication_token = request.headers[:authentication_token]

      unless authentication_token.present?
        json_response 'authentication_token can not be blank', false, {}, :bad_request

        return
      end

      @current_user = User.find_by_authentication_token(authentication_token)

      if @current_user.nil?
        json_response 'authentication_token not found', false, {}, :bad_request

        return
      end
    end
end
