class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :record_list
  has_one_attached :image
 
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shopping_charge
  belongs_to_active_hash :ship_form
  belongs_to_active_hash :delivery_time

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shopping_charge_id
    validates :ship_form_id
    validates :delivery_time_id
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
            format: { with: /\A[0-9]+\z/ }

  with_options presence: true do
    validates :item_name
    validates :description
    validates :image
  end
end