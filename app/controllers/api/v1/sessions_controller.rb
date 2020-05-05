class Api::V1::SessionsController < Devise::SessionsController
  before_action :load_user, only: :create
  before_action :valid_token, only: :destroy
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in :user, @user
      @user = @user.serialize
      json_response 'Bem vindo!', true, { user: @user }, :ok
    else
      json_response 'Usuário ou senha incorretos.', false, {}, :unauthorized
    end
  end

  def destroy
    sign_out @user
    @user.generate_new_authentication_token
    json_response 'Logout efetuado.', true, {}, :ok
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    if @user
      return @user
    else
      json_response 'Usuário ou senha incorretos.', false, {}, :unauthorized
    end
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers['AUTH-TOKEN']
    if @user
      return @user
    else
      json_response 'Invalid token.', false, {}, :unauthorized
    end
  end
end
