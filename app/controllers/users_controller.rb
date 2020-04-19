class UsersController < ApplicationController
  def index
    @users = User.where(id: UserRole.where(user_id: 1).map(&:user_id))
    json_response 'Usuários', true, { users: @users }, :ok
  end
end
