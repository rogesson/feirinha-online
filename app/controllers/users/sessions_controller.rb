# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :authenticate
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def authenticate
    asdasdas
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
