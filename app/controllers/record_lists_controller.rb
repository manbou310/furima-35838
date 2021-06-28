class RecordListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :user_check

  def index
    @record_list_address = RecordListAddress.new
  end

  def create
    @record_list_address = RecordListAddress.new(record_list_params)
    if @record_list_address.valid?
      pay_item
      @record_list_address.save
      redirect_to root_path
    else
      render :index
    end
  end
end


private
  def record_list_params
    params.require(:record_list_address).permit(:postcode, :street, :building, :phone_number, :ship_form_id, :city).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: record_list_params[:token],
      currency: 'jpy'
    )
  end

  def user_check
    if  @item.user_id == current_user.id || @item.record_list.present?
      redirect_to root_path
    end
  end