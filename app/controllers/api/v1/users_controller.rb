class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all.map(&:serialize)
    json_response 'Todos os usuários', true, { users: @users }, :ok
  end

  def show
    if @user = User.find_by(id: params[:id])
      @user = @user.serialize
      json_response 'Visualizar informações', true, { user: @user }, :ok
    else
      json_response 'Algo deu errado', false, {}, :bad_request
    end
  end

  def edit
    if @user = User.find_by(id: params[:id])
      json_response 'Alterar informações', true, { user: @user }, :ok
    else
      json_response 'Algo deu errado', false, {}, :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update_attributes(user_params)
      json_response 'Suas informações foram atualizadas', true, { user: @user }, :ok
    else
      json_response 'Não foi possível atualizar', false, { user: @user }, :unprocessable_entity
    end
  end

  # def destroy
  #   @user = User.find_by(id: params[:id])
  #
  #   if @user
  #     json_response 'Seu usuário foi removido', true, {}, :ok
  #   else
  #     json_response 'Não foi possível excluir' false, { user: @user }, :unprocessable_entity
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
  end
end
