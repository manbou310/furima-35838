## users table

|Column            |Type       |Options      |
|------------------|-----------|-------------|
|nickname          |string     |null: false  |
|email             |string     |unique: true |
|encrypted_password|string     |null: false  |
|last_name_zenkaku |string     |null: false  |
|first_name_zenkaku|string     |null: false  |
|last_name_kana    |string     |null: false  |
|first_name_kana   |string     |null: false  |
|birth_date        |string     |null: false  |


### Association
- has_many :items
- has_many :records_lists



## items table

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user               |reference  |null: false, foreign_key: true |
|item_name          |string     |null: false                    |
|description_id     |integer    |null: false                    |
|category _id       |integer    |null: false                    |
|shopping_charge_id |integer    |null: false                    |
|ship_form_id       |integer    |null: false                    |
|delivery_time_id   |integer    |null: false                    |
|price              |reference  |null: false                    |


### Association
- belongs_to :user
- has_one :address
- has_one :records_list



## address table

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|postal_address     |string     |null: false                    |
|prefecture_id      |integer    |null: false                    |
|city               |string     |null: false                    |
|street             |string     |null: false                    |
|building           |string     |null: false                    |
|phone_number       |string     |null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :records_list



## record_lists table

|Column            |Type       |Options                        |
|------------------|-----------|-------------------------------|
|user              |reference  |null: false, foreign_key: true |
|item              |reference  |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address
