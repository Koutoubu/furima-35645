# フリマアプリ

## usersテーブル

| Column               | Type   | Options                  |
|----------------------|--------|--------------------------|
| nickname             | string | null: false              |
| email                | string | null: false unique: true |
| encrypted_password   | string | null: false              |
| last_name            | string | null: false              |
| first_name           | string | null: false              |
| last_name_kana       | string | null: false              |
| first_name_kana      | string | null: false              |
| birthday             | date   | null: false              |


### Association

- has_many :items
- has_many :shares





## itemsテーブル

| Column             | Type       | Options                      |
|--------------------|------------|------------------------------|
| name               | string     | null: false                  |
| price              | integer    | null: false                  |
| explanation        | text       | null: false                  |
| seller_id          | integer    | null: false                  |
| category_id        | integer    | null: false                  |
| status_id          | integer    | null: false                  |
| area_id            | integer    | null: false                  |
| date_id            | integer    | null: false                  |
| user               | references | foreign_key: true null:false |


### Association

- has_one :shared
- belongs_to :user





## sharedテーブル

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| item              | references | foreign_key: true |
| user              | references | foreign_key: true |


### Association

- has_one :orders
- belongs_to :item
- belongs_to :user





## ordersテーブル

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postal_number  | string     | null: false       |
| area_id        | integer    | null: false       |
| municipalities | string     | null: false       |
| address        | string     | null: false       |
| building       | string     |                   |
| tell_number    | string     | null: false       |
| shared         | references | foreign_key: true |


### Association

- belongs_to :shared