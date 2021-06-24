class RecordListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @record_list_address = RecordListAddress.new
  end

  def create
    @record_list_address = RecordListAddress.new(record_list_params)
    if @record_list_address.valid?
      @record_list_address.save
      redirect_to root_path
    else
      render :index
    end
  end
end


private

  def record_list_params
    params.require(:record_list_address).permit(:postcode, :street, :building, :phone_number, :ship_form_id, :city).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
