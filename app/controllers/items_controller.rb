class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :identification, only: [:edit, :update, :destroy]
  before_action :sale_check, only:[:edit, :update, :destroy]


  def index
    @items = Item.order("created_at DESC")
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
      render :show
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  
  private
  def item_params
    params.require(:item).permit(:item_name, :image ,:description, :category_id, :status_id, :shopping_charge_id,
                                  :ship_form_id, :delivery_time_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def identification
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def sale_check
    if @item.record_list.present?
      redirect_to root_path
    end
  end

end

