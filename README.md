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
| birthday             | string | null: false              |



## itemsテーブル

| Column             | Type       | Options                      |
|--------------------|------------|------------------------------|
| name               | string     | null: false                  |
| price              | string     | null: false                  |
| shippingmathod     | string     | null: false                  |
| seller             | string     | null: false                  |
| category           | string     | null: false                  |
| status             | string     | null: false                  |
| paymentdestination | string     | null: false                  |
| date               | string     | null: false                  |
| user               | references | foreign_key: true null:false |



## ordersテーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| area        | string     | null: false       |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |



## sharedテーブル

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| paymentmethod     | string     | null: false       |
| item              | references | foreign_key: true |
| user              | references | foreign_key: true |
