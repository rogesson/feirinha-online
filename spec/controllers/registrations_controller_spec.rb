require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, :type => :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe '#create' do
    it 'should create a new user when data is valid' do
      params = { user: { name: 'User', email: 'teste@mail.com', password: '123456', password_confirmation: '123456', doc_number: CPF.generate } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Conta criada com sucesso!')
    end

    xit 'should not create a new user with invalid email' do
      params = { user: { name: 'User', email: 'teste', password: '123456', password_confirmation: '123456', doc_number: CPF.generate } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Algo deu errado!')
    end

    xit 'should not create a new user with empty password' do
      params = { user: { name: 'User', email: 'teste@mail.com', password: '', password_confirmation: '', doc_number: CPF.generate } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Algo deu errado!')
    end

    xit 'should not create a new user with mismatching password confirmation' do
      params = { user: { name: 'User', email: 'teste@mail.com', password: '123456', password_confirmation: '1234567', doc_number: CPF.generate } }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Algo deu errado!')
    end
  end
end
