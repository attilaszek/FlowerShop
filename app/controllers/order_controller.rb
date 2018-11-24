class OrderController < ApplicationController
  
  def dashboard
    @status = params[:status_id].to_i if params[:status_id].present?
    if params[:status_id].nil? or not @status.between?(0, Order::STATUSES.length-1) 
      @orders = Order.all
    else
      @orders = Order.where(status: @status)
    end

    respond_to :html, :js
  end

  def deliver
    Order.find(params[:id]).update_column(:status, Order::DELIVERED)

    redirect_to controller: 'order', action: 'dashboard', status_id: params[:status_id]
  end

end
