require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  before(:each) do
    @user = User.create(name: 'User', password: '123456', email: 'teste@teste.com', doc_number: '225.401.950-32')
    @user2 = User.create(name: 'User 2', password: '123456', email: 'teste2@teste.com', doc_number: '395.125.450-55')
  end

  describe "#index" do
    it "List all users of aplication" do
      set_authentication_token

      @user.update(authentication_token: 'qualquertoken')
      @user2.update(authentication_token: 'anytoken')

      get :index

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("users_index.json"))
    end
  end

  describe '#show' do
    it 'returns serialized json for a specific user'do
      set_authentication_token

      @user.update(authentication_token: 'qualquertoken')

      params = { id: @user.id }
      get :show, params: params

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("users_show.json"))
    end

    xit 'returns empty data when user id doesn\'t exist' do
      set_authentication_token

      params = { id: 777 }
      get :show, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe '#update' do
    it 'returns updated data when the user is updated' do
      set_authentication_token

      @user.update(authentication_token: 'qualquertoken')

      params = { name: 'Updated', email: 'updated@mail.com' }
      patch :update, params: { id: @user.id, user: params }
      @user.name = params[:name]
      @user.email = params[:email]
      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("users_update.json"))
    end

    xit 'returns unchanged user when trying to update with invalid data' do
      set_authentication_token

      @user.update(authentication_token: 'qualquertoken')

      params = { name: 'Updated', email: 'updated' }
      patch :update, params: { id: @user.id, user: params }
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(json_response['message']).to eq('Não foi possível atualizar')
    end
  end

  describe '#destroy' do
    it 'deactivates the user and returns empty data hash' do
      set_authentication_token

      @user.update(authentication_token: 'qualquertoken')

      params = { id: @user.id }

      delete :destroy, params: params

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("users_destroy.json"))
    end
  end

  def read_fixture(file_name)
    JSON.parse(file_fixture(file_name).read)
  end

  def set_authentication_token
    request.headers.merge({ "authentication-token" => "qualquertoken" })
  end
end
