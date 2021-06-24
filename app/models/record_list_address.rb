class RecordListAddress
  include ActiveModel::Model
  attr_accessor :postcode, :city, :street, :building, :phone_number, :ship_form_id, :user_id, :items_id

  with_options presence: true do
    validates :user_id
    validates :items_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :street
    validates :building
    validates :phone_number,numericality: { only_integer: true }, length: { maximum: 11 }
  end
  validates :ship_form_id,numericality: { other_than: 1 } 

  def save
    record_list = RecordList.create(user_id: user_id, items_id: items_id)
    Address.create(postcode: postcode, city: city, street: street, building: building, phone_number: phone_number, ship_form_id: ship_form_id, record_list_id: record_list_id)
  end
end