# テーブル設計

## usersテーブル

| Column          | Type               | Options     |
| --------------- | ------------------ | ----------- |
| email           | encrypted_password | null: false |
| password        | encrypted_password | null: false |
| nickname        | string             | null: false |
| first_name      | string             | null: false |
| last_name       | string             | null: false |
| first_name_kana | string             | null: false |
| last_name_kana  | string             | null: false |
| birth_date      | date               | null: false |
### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column      | Type       | Options       |
| ----------- | ---------- | ------------- |
| item_name   | string     | null: false   |
| description | text       | null: false   |
| category    | integer    | null: false   |
| states      | integer    | null: false   |
| freight     | integer    | null: false   |
| ship_state  | integer    | null: false   |
| speed       | integer    | null: false   |
| price       | integer    | null:false    |
| user        | references |               |
### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| state         | integer    | null: false |
| address       | string     | null: false |
| street        | string     | null: false |
| building      | string     |             |
| phone         | string     | null: false |
| user          | references |             |
### Association
-belongs_to :user
-belongs_to :item