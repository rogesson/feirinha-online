class Api::V1::OrdersController < ApplicationController
  # before_action :check_orders, only: :create

  def index
    orders = Order.load_history(@current_user)
    if orders
      json_response 'Histórico de pedidos', true, { orders: orders }, :ok
    else
      json_response 'Algo deu errado', false, {}, :unprocessable_entity
    end
  end

  def show
    order = Order.find_by(id: params[:id])
    if order
      json_response 'Detalhes do pedido', true, { order: order.serialize }, :ok
    else
      json_response 'Algo deu errado', false, {}, :unprocessable_entity
    end
  end

  def create
    order = Order.new(store_id: params[:store_id])
    order.user_id = @current_user.id
    order.order_date = Time.now
    order.order_status_id = OrderStatus.find_by(name: 'Aberto').id
    products_order = ProductsOrder.new(order_params.except(:operation))
    if order.save
      products_order.update(order_id: order.id)
      json_response 'Pedido criado', true, { order: order.serialize }, :ok
    else
      json_response 'Algo deu errado', false, {}, :unprocessable_entity
    end
  end

  def update

  end

  def add

  end

  def remove

  end

  def destroy

  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :total_price, :operation)
  end

  # def check_orders
  #   store = Store.find_by(id: params[:store_id])
  #   order = Order.load_open_order(@current_user, store) || return
  #
  #   redirect_to action: :update, id: order.id
  # end
end
