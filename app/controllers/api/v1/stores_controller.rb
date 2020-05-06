class Api::V1::StoresController < ApplicationController
  # GET
  # localhost:3000/api/v1/stores/
  def index
    stores = Store.all.map(&:serialize)
    json_response 'Todas as lojas', true, { stores: stores }, :ok
  end

  # POST
  # localhost:3000/api/v1/stores/
  def create
    store = Store.new(store_params)
    store.user_id = current_user.id

    if store.save!
      json_response 'Loja criada!', true, { store: store.serialize }, :ok
    else
      json_response 'Não foi possível salvar', false, {}, :bad_request
    end
  end

  # GET
  # localhost:3000/api/v1/stores/:id
  def show
    @store = Store.find_by(id: params[:id])

    if @store
      store_hash = @store.attributes
      store_hash.store('products', @store.products)
      json_response 'Loja encontrada', true, { store: store_hash }, :ok
    else
      json_response 'Loja não encontrada', false, {}, :not_found
    end
  end

  # GET
  # localhost:3000/api/v1/stores/:id/edit
  def edit
    @store = Store.find_by(id: params[:id])
    if @store
      if is_store_owner?(@store.user.id)
        json_response 'Edite sua loja', true, { store: @store }, :ok
      else
        json_response 'Acesso negado', false, {}, :unauthorized
      end
    else
      json_response 'Loja não encontrada', false, {}, :not_found
    end
  end

  # PATCH
  # localhost:3000/api/v1/stores/:id/
  def update
    @store = Store.find_by(id: params[:id])
    if @store
      @store.update_attributes(params[:store])
      json_response 'Sua loja foi atualizada', true, { store: @store }, :ok
    else
      json_response 'Loja não encontrada', false, {}, :not_found
    end
  end

  # DELETE
  # localhost:3000/api/v1/stores/:id/
  def destroy
    @store = Store.find_by(id: params[:id])
    @store.destroy
    json_response 'Sua loja foi removida', true, {}, :ok
  end

  private

    def store_params
      params.require(:store).permit(:name, :category_id)
    end

    def is_store_owner?(id)
      current_user.id == id
    end
end
