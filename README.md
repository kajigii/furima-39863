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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| kana_name          | string | null: false |
| date of birth      | string | null: false |

### Association

- has_many :item
- has_many :buy

## items テーブル

| Column         | Type       | Options                        |
| ------         | ------     | -----------                    |
| item_name      | string     | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| burden         | string     | null: false                    |
| region         | string     | null: false                    |
| until shipping | string     | null: false                    |
| price          | string     | null: false                    |
| seller         | string     | null: false                    |
| user           | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :buy

## buy テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

## address テーブル

| Column             | Type       | Options                        |
| -------            | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| street_address     | string     | null: false                    |
| building           | string     | null: false                    |
| telephone number   | string     | null: false                    |
| buy                | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- has_one    :buy
- belongs_to :item