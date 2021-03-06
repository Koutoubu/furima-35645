class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :seller_id, :category_id, :status_id, :area_id, :date_id_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end

end
