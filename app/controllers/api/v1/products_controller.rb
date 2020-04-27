class Api::V1::ProductsController < ApplicationController
  def index
    products = current_store.products

    json_response 'Lista de produtos', true, { products: products }, :ok
  end

  def create
    product_hash = { 'product' => product_params }
    product_hash['product']['category_id'] = current_store.category_id
    product_hash['product']['store_id'] = current_store.id

    product = Product.new(product_hash['product'])

    if product.save
      json_response 'Produto inserido!', true, { product: product }, :ok
    else
      json_response 'Não foi possível salvar', false, {}, :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id])

    if product
      json_response 'Visualizar produto', true, { product: product }, :ok
    else
      json_response 'Algo deu errado', false, {}, :not_found
    end
  end

  def edit
    product = Product.find_by(id: params[:id])

    if product
      json_response 'Editar produto', true, { product: product }, :ok
    else
      json_response 'Algo deu errado', false, {}, :not_found
    end
  end

  def update
    product = Product.find_by(id: params[:id])

    if product
      product.update_attributes(product_params)
      json_response 'Produto atualizado', true, { product: product }, :ok
    else
      json_response 'Algo deu errado', false, {}, :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])

    if product
      product.destroy
      json_response 'Produto excluído', true, {}, :ok
    else
      json_response 'Algo deu errado', false, {}, :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
