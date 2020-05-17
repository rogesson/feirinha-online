class Api::V1::ProductsController < ApplicationController
  before_action :check_user_store, except: [:show, :index]

  def index
    products = Store.find_by_id(params[:store_id])
      .products.map(&:serialize)

    json_response 'Lista de produtos', true, { products: products }, :ok
  end

  def create
    product = Product.new(product_params)
    product.store_id = @store.id

    if product.save
      json_response 'Produto inserido!', true, { product: product.serialize }, :ok
    else
      puts product.errors.full_messages
      json_response 'Não foi possível salvar', false, {}, :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id], store_id: params[:store_id])

    if product
      json_response 'Visualizar produto', true, { product: product.serialize }, :ok
    else
      json_response 'Algo deu errado', false, {}, :not_found
    end
  end

  def update
    product = Product.find_by(id: params[:id], store_id: @store.id)

    if product.update_attributes(product_params)
      json_response 'Produto atualizado', true, { product: product.serialize }, :ok
    else
      json_response 'Algo deu errado', false, {}, :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id], store_id: @store.id)

    if product.nil? || product.destroy!
      json_response 'Produto excluído', true, {}, :ok
    else
      json_response 'Algo deu errado', false, {}, :unprocessable_entity
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :image_url)
    end

    def check_user_store
      @store = Store.find_by(id: params[:store_id], user_id: current_user.id)

      raise "This store is not from user #{params[:user_id]}" if @store.nil?
    end
end
