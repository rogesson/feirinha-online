class Api::V1::StoresController < ApplicationController
  def index
    @stores = Store.all
    json_response 'All stores', true, { stores: @stores }, :ok
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
