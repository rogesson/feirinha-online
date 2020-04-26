class UsersController < ApplicationController
  def index
    users = User.all.map(&:serialize)
    json_response 'List of all users', true, { users: users }, :ok
  end
end
