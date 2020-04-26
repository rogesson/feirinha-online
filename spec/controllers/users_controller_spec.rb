require 'rails_helper'

def read_fixture(file_name)
  JSON.parse(file_fixture(file_name).read)
end

RSpec.describe UsersController, :type => :controller do
  describe "#index" do
    it "List all users of aplication" do
      role = Role.create!(name: 'Vendedor')

      User.create!(name: 'User 2', password: '1234569ms', email: 'teste1@teste', role_id: role.id)

      User.create!(name: 'User 1', password: '1234569ms', email: 'teste2@teste', role_id: role.id)

      get :index

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(read_fixture('users_index.json'))
    end
  end
end