require 'rails_helper'

RSpec.describe Api::V1::StoresController, :type => :controller do

  before(:each) do
    @role = Role.create(name: 'Vendedor')
    @category = Category.create(name: 'Alimentos')
    @user = User.create(name: 'Teste', email: 'teste@mail.com', password: '123456', role_id: @role.id)
  end

  describe '#index' do
    it 'lists all active stores' do
      user2 = User.create(name: 'Teste 2', email: 'teste2@mail.com', password: '123456', role_id: @role.id)
      @store1 = Store.create(name: 'Loja 1', category_id: @category.id, user_id: @user.id)
      @store2 = Store.create(name: 'Loja 2', category_id: @category.id, user_id: user2.id)

      get :index, params: { authentication_token: @user.authentication_token}

      expect(JSON.parse(response.body))
        .to eq(read_fixture("stores_index.json"))
    end
  end

  describe '#create' do
    it 'creates a new store with valid data' do
      params = {
        authentication_token: @user.authentication_token,
        store: {
          name: 'Store 3',
          category_id: @category.id
        }
      }

      post :create, params: params
      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("stores_create.json"))
    end
  end

  describe '#show' do
  end

  def read_fixture(file_name)
    JSON.parse(file_fixture(file_name).read)
  end
end
