# フリマアプリ

## usersテーブル

| Column               | Type   | Options                  |
|----------------------|--------|--------------------------|
| nickname             | string | null: false              |
| email                | string | null: false unique: true |
| encrypted_password   | string | null: false              |
| last_name            | string | null: false              |
| first_name           | string | null: false              |
| last_name_KANA       | string | null: false              |
| first_name_KANA      | string | null: false              |
| birthday             | date   | null: false              |


### Association

- has_many :items
- has_one :shared





## itemsテーブル

| Column             | Type       | Options                      |
|--------------------|------------|------------------------------|
| name               | string     | null: false                  |
| price              | integer    | null: false                  |
| explanation        | text       | null: false                  |
| seller             | string     | null: false                  |
| category_id        | integer    | null: false                  |
| status             | integer    | null: false                  |
| area               | integer    | null: false                  |
| date               | integer    | null: false                  |
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
| postal_number  | integer    | null: false       |
| prefectures    | string     | null: false       |
| municipalities | string     | null: false       |
| address        | integer    | null: false       |
| buillding      | string     | null: false       |
| tell_number    | integer    | null: false       |
| shared         | references | foreign_key: true |


### Association

- belongs_to :shared