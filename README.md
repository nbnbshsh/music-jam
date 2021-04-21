# README

## usersテーブル

|Column               |Type     |Options                  |
|---------------------|---------|-------------------------|
|email                |string   |null: false,unique: true |
|encrypted_password   |string   |null: false              |
|nickname             |string   |null: false              |
|instrument           |string   |null: false              |
|prefecture_id        |integer  |null: false              |
|history_id           |integer  |null: false              |
|gender_id            |integer  |null: false              |
|age                  |string   |null: false              |
|genre                |string   |null: false              |
|artist               |string   |null: false              |

### Association
has_many :movies
has_many :directs
has_many :comments
has_many :user

## moviesテーブル

|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|instrument           |string     |null: false                    |
|text                 |text       |null: false                    |
|music                |string     |null: false                    |
|artist               |string     |null: false                    |
|user                 |references |null: false, foreign_key: true |

### Association
belongs_to :user
has_many :comments
has_many :likes

## roomsテーブル

|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|message              |text       |null: false                    |
|user                 |references |null: false, foreign_key: true |


### Association
belongs_to :user

## commentsテーブル

|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|memo                 |text       |null: false                    |
|movie                |references |null: false, foreign_key: true |


### Association
belongs_to :movie
belongs_to :user

## likesテーブル

|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|movie                |references |null: false, foreign_key: true |
|user                 |references |null: false, foreign_key: true |


### Association
belongs_to :movie
belongs_to :user


