class SharedController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(shared_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
 
  private
 
  def shared_params
    params.require(:order).permit(:postal_number, :area_id, :municipalities, :address, :building, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

end
