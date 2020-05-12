class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create
  skip_before_action :authenticate, only: :create

  # Route: api/v1/signup
  def create
    @user = User.new(user_params)
    if @user.save && @user.validate_cpf_cnpj
      json_response 'Conta criada com sucesso!', true, { user: @user }, :ok
    else
      json_response 'Algo deu errado!', false, {}, :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :doc_number)
  end

  def ensure_params_exist
    return if params[:user].present?
    json_response 'Missing params', false, {}, :bad_request
  end
end
