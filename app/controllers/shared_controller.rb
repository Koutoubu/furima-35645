class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :define_item, only: [:index, :create] 
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_index1, only: [:index, :create]
  
    def index
     @shared_address = SharedAddress.new
    end
  
    def create
      @shared_address = SharedAddress.new(shared_params)
      if @shared_address.valid?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
        Payjp::Charge.create(
          amount: @item.price,  
          card: shared_params[:token],    
          currency: 'jpy'                 
        )
        @shared_address.save
        redirect_to root_path
      else
        render :index
      end
    end
  
    private
  
    def shared_params
      params.require(:shared_address).permit(:postal_number, :area_id, :municipalities, :address, :building, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
    end
  
    def define_item
      @item = Item.find(params[:item_id])
    end
  
    def move_to_index
      if current_user.id == @item.user_id
      redirect_to root_path
      end
    end
    
    def move_to_index1
      if @item.shared != nil
        redirect_to root_path
      end
    end
  
  end
