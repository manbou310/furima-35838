class Item < ApplicationRecord
  belongs_to :user
  #has_one :record_list

  with_options presence: true do
    :item_name,
    :description,
    :price,
    :category_id,
    :status_id,
    :shopping_charge_id,
    :ship_form_id,
    :delivery_time_id,
  end