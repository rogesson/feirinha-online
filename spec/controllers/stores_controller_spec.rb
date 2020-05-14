require 'rails_helper'

RSpec.describe Api::V1::StoresController, :type => :controller do

  before(:each) do
    @category = Category.create!(name: 'Alimentos')
    @user = User.create!(name: 'Teste', email: 'teste@mail.com', password: '123456', doc_number: CPF.generate)
    @status = Status.create!(name: 'Ativo')
  end

  describe '#index' do
    it 'lists all active stores' do
      set_authentication_token

      user2 = User.create!(name: 'Teste 2', email: 'teste2@mail.com', password: '123456', doc_number: CPF.generate)
      @store1 = Store.create!(name: 'Loja 1',
                              category_id: @category.id,
                              user_id: @user.id,
                              status: @status,
                              phone_number: '(19)9999-9999',
                              image_url: 'http://anystring.com')
      @store2 = Store.create!(name: 'Loja 2',
                              category_id: @category.id,
                              user_id: user2.id,
                              status: @status,
                              phone_number: '(19)8888-8888',
                              image_url: 'http://anotherstring.com')

      get :index, params: {}

      json_response = JSON.parse(response.body)
      expect(json_response)
        .to eq(read_fixture("stores_index.json"))
    end
  end

  describe '#create' do
    it 'creates a new store with valid data' do
      set_authentication_token

      params = {
        store: {
          name: 'Store 3',
          category_id: @category.id,
          status_id: @status.id,
          phone_number: '(19)9999-9999',
          image_url: 'http://anystring.com'
        }
      }

      post :create, params: params

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("stores_create.json"))
    end
  end

  describe '#show' do
    it 'shows store information' do
      set_authentication_token

      @store1 = Store.create!(name: 'Loja 1',
                              category_id: @category.id,
                              user_id: @user.id,
                              status: @status,
                              phone_number: '(19)9999-9999',
                              image_url: 'http://anystring.com')

      get :show, params: { id: @store1.id }

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("stores_show.json"))
    end
  end

  describe '#update' do
    it 'updates a new store with valid data' do
      set_authentication_token
      @store = Store.create!(name: 'Loja 1', category_id: @category.id, user_id: @user.id, status: @status)

      params = {
        id: @store.id,
        store: {
          name: 'Store 4 Updated',
          phone_number: '(19)9999-9999',
          image_url: 'http://anystring.com'
        }
      }

      patch :update, params: params

      json_response = JSON.parse(response.body)

      expect(json_response)
        .to eq(read_fixture("stores_update.json"))
    end
  end

  def read_fixture(file_name)
    JSON.parse(file_fixture(file_name).read)
  end

  def set_authentication_token
    request.headers.merge({ "authentication-token" => @user.authentication_token })
  end
end
