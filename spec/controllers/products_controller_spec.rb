require 'rails_helper'

RSpec.describe Api::V1::ProductsController, :type => :controller do

  before do
    @user = User.create!(name: 'Teste', email: 'teste1@mail.com', password: '123456', doc_number: CPF.generate)

    @status = Status.create!(name: 'inactive')
    @category = Category.create!(name: 'Alimentos')
    @store = Store.create!(name: 'Loja1', category: @category, user: @user, status: @status)
  end

  describe '#index' do
    it 'lists all products of a given store' do
      set_authentication_token

      Product.create!(name: "Beterraba", price: 1.99, category_id: @category.id, store_id: @store.id)

      Product.create!(name: "Milho", price: 99, category_id: @category.id, store_id: @store.id)

      get :index, params: { store_id: @store.id }

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("products_index.json"))
    end
  end

  describe '#create' do
    it 'creates a new product' do
      set_authentication_token

      product_param = {
        name: "Bolo",
        price: 15.99,
      }

      post :create, params: { store_id: @store.id, product: product_param }

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("products_create.json"))
    end
  end

  describe '#show' do
    it 'shows the product information' do
      set_authentication_token

      product = Product.create!(name: "Beterraba", price: 1.99, category_id: @category.id, store_id: @store.id)

      get :show, params: { store_id: 1, id: product.id }

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("products_show.json"))
    end
  end

  describe '#update' do
    it 'updates product with new informations' do
      set_authentication_token

      product = Product.create!(name: "Beterraba", price: 1.99, category_id: @category.id, store_id: @store.id)

      product_params  = {
        name: "Cenoura",
        price: 3.66
      }

      get :update, params: { store_id: 1, id: product.id, product: product_params}

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("products_update.json"))
    end
  end

  describe '#destroy' do
    it 'destroys product with new informations' do
      set_authentication_token

      product = Product.create!(name: "Beterraba", price: 1.99, category_id: @category.id, store_id: @store.id)

      get :destroy, params: { store_id: 1, id: product.id }

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("products_destroy.json"))
    end
  end

  def set_authentication_token
    request.headers.merge({ "authentication-token" => @user.authentication_token })
  end

  def read_fixture(file_name)
    JSON.parse(file_fixture(file_name).read)
  end
end