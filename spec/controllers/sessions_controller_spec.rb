require 'rails_helper'

RSpec.describe Api::V1::SessionsController, :type => :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    role = Role.create(name: 'Comprador')
    @user = User.create(name: 'User', password: '123456', email: 'teste@teste.com', role_id: role.id)
  end

  describe '#create' do
    it 'should return serialized json when user logs in' do
      params = { user: { email: @user.email, password: @user.password } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({ "user" => @user.serialize.stringify_keys })
      expect(response).to have_http_status(:ok)
    end

    it 'should not login a user with non-existing email' do
      params = { user: { email: 'anything@mail.com', password: 'anything' } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(response).to have_http_status(:unauthorized)
    end

    it 'should not login a user with incorrect password' do
      params = { user: { email: @user.email, password: 'anything' } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe '#destroy' do
    it 'should logout the user' do
      set_authentication_token
      params = { user: { email: @user.email, password: @user.password } }

      delete :destroy

      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq({})
      expect(json_response['message']).to eq('Logout efetuado.')
    end
  end

  def set_authentication_token
    request.headers.merge({ "authentication-token" => @user.authentication_token })
  end
end
