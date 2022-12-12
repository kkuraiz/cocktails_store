class UserProfileController < ApplicationController
  def order_history
    @orders = Order.where("user_id LIKE ?", current_user.id).order(created_at: :desc)
  end

  def show
    @order= Order.find(params[:id])
    @order_items = OrderItem.where("order_id LIKE ? ", params[:id])
    order_province = @order.province.to_s
    province = Province.find_by(code: order_province)
    @tax_rate = province.pst + province.pst + province.hst
  end
end
