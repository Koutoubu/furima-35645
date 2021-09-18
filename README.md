# フリマアプリ

## usersテーブル

| Column               | Type   | Options                  |
|----------------------|--------|--------------------------|
| nickname             | string | null: false              |
| email                | string | null: false unique: true |
| encrypted_password   | string | null: false              |
| lastname             | string | null: false              |
| firstname            | string | null: false              |
| lastname2            | string | null: false              |
| firstname2           | string | null: false              |
| birthday             | date   | null: false              |


### Association

- has_many :items
- has_many :shared





## itemsテーブル

| Column             | Type       | Options                      |
|--------------------|------------|------------------------------|
| name               | string     | null: false                  |
| price              | integer    | null: false                  |
| explanation        | text       | null: false                  |
| seller             | string     | null: false                  |
| category_id        | integer    | null: false                  |
| status             | string     | null: false                  |
| paymentdestination | string     | null: false                  |
| date               | string     | null: false                  |
| user               | references | foreign_key: true null:false |


### Association

- has_many :shared
- belongs_to :items





## sharedテーブル

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| item              | references | foreign_key: true |
| user              | references | foreign_key: true |


### Association

- has_many :orders
- belongs_to :items
- belongs_to :users





## ordersテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| card        | integer    | null: false       |
| deadline    | integer    | null: false       |
| code        | integer    | null: false       |
| area        | string     | null: false       |
| number      | integer    | null: false       |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |


### Association

- belongs_to :shared