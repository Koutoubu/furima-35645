# README

## usersテーブル

| Column     | Type   | Options     |
|------------|--------|-------------|
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| profile    | text   | null: false |


## itemsテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| name        | string     | null: false       |
| category    | string     | null: false       |
| explanation | text       | null: false       |
| status      | text       | null: false       |
| user        | references | foreign_key: true |


## ordersテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| charges     | string     | null: false       |
| area        | string     | null: false       |
| date        | string     | null: false       |
| explanation | text       | null: false       |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |