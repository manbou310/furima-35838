class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]


  def index
  end

  def new
  end
  
  def create
  end


  private
  params.require(:items).permit(:item_name, :image ,:description, :category_id, :status_id, :shopping_charge_id,
                                :ship_form_id, :delivery_time_id, :price, :user).merge(user_id: current_user.id)
end

