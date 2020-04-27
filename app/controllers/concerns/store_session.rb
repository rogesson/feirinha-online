module StoreSession
  def current_store
    @current_store = Store.find_by(id: params[:store_id])
  end
end
