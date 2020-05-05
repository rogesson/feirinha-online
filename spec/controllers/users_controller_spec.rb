require 'rails_helper'

# def read_fixture(file_name)
#   JSON.parse(file_fixture(file_name).read)
# end

RSpec.describe Api::V1::UsersController, :type => :controller do
  before(:each) do
    role = Role.create(name: 'Comprador')
    @user = User.create(name: 'User', password: '123456', email: 'teste@teste.com', role_id: role.id)
    @user2 = User.create(name: 'User 2', password: '123456', email: 'teste2@teste.com', role_id: role.id)
  end

  describe "#index" do
    it "List all users of aplication" do
      get :index
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response['message']).to eq('Todos os usuários')
      expect(json_response['data']).to eq(User.all.as_json)
    end
  end

  describe '#show' do
    it 'should return serialized json for a specific user'do
      params = { id: @user.id }
      get :show, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({ "user" => @user.serialize.stringify_keys })
      expect(response).to have_http_status(:ok)
    end

    it 'should return empty data when user id doesn\'t exist' do
      params = { id: 777 }
      get :show, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe '#edit' do
    it 'should return serialized json for a specific user'do
      params = { id: @user.id }
      get :edit, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({ "user" => @user.serialize.stringify_keys })
      expect(response).to have_http_status(:ok)
    end

    it 'should return empty data when user id doesn\'t exist' do
      params = { id: 777 }
      get :edit, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe '#update' do
    it 'should return updated data when the user is updated' do
      params = { name: 'Updated', email: 'updated@mail.com' }
      patch :update, params: { id: @user.id, user: params }
      @user.name = params[:name]
      @user.email = params[:email]
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({ "user" => @user.serialize.stringify_keys })
      expect(response).to have_http_status(:ok)
    end

    it 'should return unchanged user when trying to update with invalid data' do
      params = { name: 'Updated', email: 'updated' }
      patch :update, params: { id: @user.id, user: params }
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({ "user" => @user.serialize.stringify_keys })
      expect(json_response['message']).to eq('Não foi possível atualizar')
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#destroy' do
    it 'should deactivate the user and return empty data hash' do
      params = { id: @user.id }
      delete :destroy, params: @user.id
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(json_response['message']).to eq('Usuário excluído')
      expect(response).to have_http_status(:ok)
    end
  end
end
