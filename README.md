 README

# アプリケーション名
Music-jam

# 概要
歌や楽器などの音楽のセッションをする仲間を探すためのアプリケーションである。音楽の動画投稿に加えて、その個人の楽器や好きなジャンル、活動地域に合わせて、セッションできる仲間を選び、アプローチをかけることができる。

# 本番環境
http://18.182.188.122/

ログイン情報 

 ・Eメール　test@test

 ・パスワード　test1234

# 制作背景
3年前から趣味として、アコースティックギターを始めたが、人とセッションの様なことをしたり、同じような境遇な人と繋がりたいと思ったときに音楽教室や実際の友達の繋がりを持っていないと輪を広げにくいと感じていた。その”音楽での繋がり”を実現できるためのアプリとなってい流。

# DEMO


# 工夫したポイント
繋がる相手がどのような情報を持っているのかを明確により分かりやすく認識できるようにユーザーのページに飛んだら、情報が見やすいように記載されている。
またいいね機能やフォロー機能をつけることで、気に入った投稿やユーザーをいつでも見返せるように仕様とした。また他にもDM機能を採用し、他人にはみられないような個人間のメッセージのやりとりをできるようにしており、よりユーザーが使いやすく、繋がりを持ちやすい様な機能を揃え、工夫を施した。

# 使用技術(開発環境)
## バックエンド
Ruby,Ruby on rails
## フロントエンド
Javascript,Ajax
## データベース
MySQL,Sequel Pro
## インフラ
AWS(EC2),Capistrano,Docker
## Webサーバー
nginx
## アプリケーションサーバー
unicorn
## ソース管理
GitHunb,GitHubDesktop
## テスト
RSpec
## エディタ
VSCode


# 課題や今後実装したい機能
javascriptの知識を増やし、いいねの非同期通信を実装したい。

# DB設計
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

