class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create

  # Params: user[name], user[login], user[email], user[password], user[password_confirmation]
  # Route: api/v1/signup
  def create
    user = User.new user_params
    if user.save
      UserRole.create(user_id: user.id, role_id: params[:user][:role_id]).save
      json_response 'Conta criada com sucesso!', true, { user: user }, :ok
    else
      json_response 'Algo deu errado!', false, {}, :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :login, :email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?
    json_response 'Missing params', false, {}, :bad_request
  end
end
