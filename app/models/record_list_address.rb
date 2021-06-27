class RecordListAddress
  include ActiveModel::Model
  attr_accessor :postcode, :city, :street, :building, :phone_number, :ship_form_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :street
    validates :phone_number,numericality: { only_integer: true }, length: { maximum: 11 }
    validates :token
  end
  validates :ship_form_id,numericality: { other_than: 1 } 

  def save
    record_list = RecordList.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, city: city, street: street, building: building, phone_number: phone_number, ship_form_id: ship_form_id, record_list_id: record_list.id)
  end
end