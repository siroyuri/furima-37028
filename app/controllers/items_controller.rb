class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
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

  def item_params
    params.require(:item).permit(
      :name, :explanation, :category_id, :status_id, :which_one_id, :prefecture_id, :days_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
