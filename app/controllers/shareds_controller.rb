class SharedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_shared_address, only: [:index]

  def index
    if current_user.id == @item.user_id || @item.shared != nil
      return redirect_to root_path
    end
  end

  def new
    @shared_address = SharedAddress.new
  end

  def create
    @shared_address = SharedAddress.new(shared_params)
    if @shared_address.valid?
      pay_item
      @shared_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private

  def shared_params
    params.require(:shared_address).permit(:postal_number, :area_id, :municicipalities, :address, :building, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shared_params[:token],
      currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def set_purchase_address
    @shared_address = SharedAddress.new
  end

end