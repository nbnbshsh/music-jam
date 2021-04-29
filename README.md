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
has_many :comments
has_many :chats
has_many :rooms, through: :user_rooms
has_many :likes, dependent: :destroy
has_many :user_rooms
has_many :active_relationships,class_name: 'Follow', foreign_key: 'user_id'
has_many :passive_relationships,class_name: 'Follow', foreign_key: 'target_user_id'
has_many :followings, through: :active_relationships,source: :target_user
has_many :followers, through: :passive_relationships,source: :user

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


### Association
has_many :chats
has_many :user_rooms

## user_roomsテーブル

|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|room                 |references |null: false, foreign_key: true |
|user                 |references |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :room

## chatsテーブル

|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|message              |text       |null: false                    |
|user                 |references |null: false, foreign_key: true |
|room                 |references |null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :room

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
belongs_to :user
belongs_to :movie

## followsテーブル

|Column               |Type       |Options                         |
|---------------------|-----------|--------------------------------|
|user                 |references |null: false, foreign_key: true  |
|target_user          |references |null: false, foreign_key: false |

### Association
belongs_to :user
belongs_to :target_user, class_name: 'User',foreign_key: 'target_user_id'

