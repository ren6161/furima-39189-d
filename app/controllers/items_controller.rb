class  ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_edit, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
    if @item.user_id == current_user.id #&& @item.order.nil? 
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_edit
    unless current_user.id == @item.user_id
    redirect_to action: :index
    end

  end

  def set_item
    @item = Item.find(params[:id])
  end
end