class CreateRecordLists < ActiveRecord::Migration[6.0]
  def change
    create_table :record_lists do |t|
      t.references  :user,  null: false, foreign_key: true
      t.references  :item,  null: false, foreign_key: true
      t.timestamps
    end
  end
end