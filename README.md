# テーブル設計

## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_date      | date   | null: false |
### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column      | Type       | Options       |
| ----------- | ---------- | ------------- |
| item_name   | string     | null: false   |
| description | text       | null: false   |
| category    | string     | null: false   |
| states      | string     | null: false   |
| freight     | string     | null: false   |
| ship_state  | string     | null: false   |
| speed       | string     | null: false   |
| image       |            | ActiveStorage |
| user_id     | references |               |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| card_number   | integer | null: false |
| exp_month     | integer | null: false |
| exp_year      | integer | null: false |
| approval_code | integer | null: false |
| postal_code   | integer | null: false |
| state         | string  | null: false |
| address       | string  | null: false |
| street        | string  | null: false |
| building      | string  |             |
| phone         | integer | null: false |
### Association
-belongs_to :user
-belongs_to :item