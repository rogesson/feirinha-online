require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, :type => :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @role = Role.create(name: 'Comprador')
  end

  describe '#create' do
    it 'should create a new user when data is valid' do
      params = { user: { name: 'User', email: 'teste@mail.com', password: '123456', password_confirmation: '123456', role_id: @role.id } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Conta criada com sucesso!')
    end

    xit 'should not create a new user with invalid email' do
      params = { user: { name: 'User', email: 'teste', password: '123456', password_confirmation: '123456', role_id: @role.id } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Algo deu errado!')
    end

    xit 'should not create a new user with empty password' do
      params = { user: { name: 'User', email: 'teste@mail.com', password: '', password_confirmation: '', role_id: @role.id } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Algo deu errado!')
    end

    xit 'should not create a new user with mismatching password confirmation' do
      params = { user: { name: 'User', email: 'teste@mail.com', password: '123456', password_confirmation: '1234567', role_id: @role.id } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Algo deu errado!')
    end
  end
end
