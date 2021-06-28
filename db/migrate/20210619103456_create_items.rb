class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,               null: false, foreign_key: true
      t.string     :item_name,          null: false 
      t.text       :description,        null: false 
      t.integer    :category_id,        null: false
      t.integer    :status_id,          null: false
      t.integer    :shopping_charge_id, null: false
      t.integer    :ship_form_id,       null: false
      t.integer    :delivery_time_id,   null: false
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
