# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------                    |
| item_name         | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| burden_id         | integer    | null: false                    |
| region_id         | integer    | null: false                    |
| until_shipping_id | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address


## addresses テーブル

| Column             | Type       | Options                        |
| -------            | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| region_id          | integer    | null: false                    |
| city               | string     | null: false                    |
| street_address     | string     | null: false                    |
| building           | string     |                                |
| telephone_number   | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to    :purchase