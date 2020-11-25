# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |
### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| description   | text       | null: false       |
| category_id   | integer    | null: false       |
| states_id     | integer    | null: false       |
| freight_id    | integer    | null: false       |
| ship_state_id | integer    | null: false       |
| ship_days_id  | integer    | null: false       |
| price         | integer    | null:false        |
| user          | references | foreign_key: true |
### Association
- belongs_to :user
- has_one :order

## addressesテーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| states_id     | integer    | null: false       |
| address       | string     | null: false       |
| street        | string     | null: false       |
| building      | string     |                   |
| phone         | string     | null: false       |
| user          | references | foreign_key: true |
### Association
- belongs_to :order

## ordersテーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |
### Association
- belongs_to :item
- has_one :address
