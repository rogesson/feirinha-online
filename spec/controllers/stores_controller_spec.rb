require 'rails_helper'

RSpec.describe Api::V1::StoresController, :type => :controller do
  before(:each) do
    @role = Role.create(name: 'Vendedor')
    @category = Category.create(name: 'Alimentos')
    @user = User.create(name: 'Teste', email: 'teste@mail.com', password: '123456', role_id: @role.id)
  end

  describe '#index' do
    it 'should list all active stores' do
      user2 = User.create(name: 'Teste 2', email: 'teste2@mail.com', password: '123456', role_id: @role.id)
      @store1 = Store.create(name: 'Loja 1', category_id: @category.id, user_id: @user.id)
      @store2 = Store.create(name: 'Loja 2', category_id: @category.id, user_id: user2.id)
      # stores_data = {
      #   stores: [
      #     {
      #       "name" => @store1.name,
      #       "category_id" => @store1.category_id,
      #       "user_id" => @store1.user_id
      #     },
      #     {
      #       "name" => @store1.name,
      #       "category_id" => @store2.category_id,
      #       "user_id" => @store2.user_id
      #     }
      #   ]
      # }
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq(stores_data)
    end
  end

  describe '#create' do
    it 'should create a new store with valid data' do
      params = { store: { name: 'Store 3', category_id: @category.id } }
      user_params = { email: @user.email, password: @user.password }
      post :create, params: { use_route: 'api/v1/login', params: user_params }
      post :create, params: params
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Loja criada!')
    end
  end
end
