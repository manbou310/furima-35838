## users table

|Column            |Type       |Options     |
|------------------|-----------|------------|
|nickname          |string     |null: false |
|email             |string     |null: false |
|encrypted_password|string     |null: false |
|name              |string     |null: false |
|last_name_zenkaku |string     |null: false |
|first_name_zenkaku|string     |null: false |
|last_name_kana    |string     |null: false |
|first_name_kana   |string     |null: false |
|birth_year        |string     |null: false |
|birth_month       |string     |null: false |
|birth_day         |string     |null: false |


### Association
- has_many :items
- has_many :addresses
- has_one :records_list




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
|items              |reference  |null: false, foreign_key: true |
|postal_address     |string     |null: false                    |
|prefecture_id      |integer    |null: false                    |
|city               |string     |null: false                    |
|street             |string     |null: false                    |
|building           |string     |unique: true                    |
|phone_number       |string     |null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :records_list



## record_lists table

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|users              |reference  |null: false, foreign_key: true |
|items              |reference  |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- belongs_to :item
