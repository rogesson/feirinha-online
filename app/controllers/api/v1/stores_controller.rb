class Api::V1::StoresController < ApplicationController

  # GET
  # localhost:3000/api/v1/stores/
  def index
    @stores = Store.all
    json_response 'Todas as lojas', true, { stores: @stores }, :ok
  end

  # POST
  # localhost:3000/api/v1/stores/
  def create
    @store = Store.new(params[:store])
    if @store.save
      json_response 'Loja criada!', true, { store: @store }, :ok
    else
      json_response 'Não foi possível salvar', false, {}, :bad_request
    end
  end

  # GET
  # localhost:3000/api/v1/stores/:id
  def show
    @store = Store.find_by(id: params[:id])
    if @store
      json_response 'Loja encontrada', true, { store: @store }, :ok
    else
      json_response 'Loja não encontrada', false, {}, :not_found
    end
  end

  # GET
  # localhost:3000/api/v1/stores/:id/edit
  def edit
    @store = Store.find_by(id: params[:id])
    if @store
      json_response 'Loja encontrada', true, { store: @store }, :ok
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
      json_response 'Loja encontrada', true, { store: @store }, :ok
    else
      json_response 'Loja não encontrada', false, {}, :not_found
    end
  end

  # DELETE
  # localhost:3000/api/v1/stores/:id/
  def destroy
    @store = Store.find_by(id: params[:id])
    if @store
      @store.destroy
      json_response 'Sua loja foi removida', true, {}, :ok
    else
      json_response 'Não foi possível excluir', false, {}, :bad_request
    end
  end
end
