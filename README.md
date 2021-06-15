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
|birth_day         |date       |null: false  |


### Association
- has_many :items
- has_many :records_lists



## items table

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user               |reference  |null: false, foreign_key: true |
|item_name          |string     |null: false                    |
|description        |text       |null: false                    |
|category_id        |integer    |null: false                    |
|status_id          |integer    |null: false                    |
|shopping_charge_id |integer    |null: false                    |
|ship_form_id       |integer    |null: false                    |
|delivery_time_id   |integer    |null: false                    |
|price              |integer    |null: false                    |


### Association
- belongs_to :user
- has_one :records_list



## address table

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|postal_address     |string     |null: false                    |
|ship_form_id       |integer    |null: false                    |
|city               |string     |null: false                    |
|street             |string     |null: false                    |
|building           |string     |                               |
|phone_number       |string     |null: false                    |
|record_list        |reference  |null: false, foreign_key: true |

### Association
- belongs_to :records_list



## record_lists table

|Column            |Type       |Options                        |
|------------------|-----------|-------------------------------|
|user              |reference  |null: false, foreign_key: true |
|item              |reference  |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has one :address
