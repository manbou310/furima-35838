class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  #has_one :record_list
  has_one_attached :image

 
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_charge
  belongs_to :ship_form
  belongs_to :delivery_time

  validates :title, :text, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id,
    validates :status_id,
    validates :shopping_charge_id,
    validates :ship_form_id,
    validates :delivery_time_id,
  end

  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999999999 }

  with_options presence: true do
    validates :item_name,
    validates :description,
    validates :image
  end
end