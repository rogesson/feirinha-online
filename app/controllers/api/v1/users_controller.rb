class Api::V1::UsersController < ApplicationController
  before_action :ensure_params_exist, only: [:update, :destroy]

  def index
    users = User.all.map(&:serialize)
    json_response 'Todos os usuários', true, { users: users }, :ok
  end

  def show
    if user = User.find_by(id: params[:id])
      json_response 'Visualizar informações', true, { user: user }, :ok
    else
      json_response 'Algo deu errado', false, {}, :bad_request
    end
  end

  def edit
    if user = User.find_by(id: params[:id])
      json_response 'Alterar informações', true, { user: user }, :ok
    else
      json_response 'Algo deu errado', false, {}, :bad_request
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update_attributes(user_params)
      json_response 'Suas informações foram atualizadas', true, { user: user }, :ok
    else
      json_response 'Algo deu errado', false, { user: user }, :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
  end
end
