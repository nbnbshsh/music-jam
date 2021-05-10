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
3年前から趣味として、アコースティックギターを始めたが、人とセッションの様なことをしたり、同じような境遇な人と繋がりたいと思ったときに音楽教室や実際の友達の繋がりを持っていないと輪を広げにくいと感じていた。その”音楽での繋がり”を実現できるためのアプリとなっている。

# DEMO
## トップページ
![530514062c70de618557e01cef396883](https://user-images.githubusercontent.com/80822571/117639142-8fd5fb00-b1be-11eb-840c-82f16c436f9c.jpg)
![16b9c0c88a91db4b54472d9972a1b566](https://user-images.githubusercontent.com/80822571/117639042-73d25980-b1be-11eb-9985-e9d0a7f90b5a.jpg)


全ユーザーの投稿が投稿順に表示される。未ログイン時は検索もしくは投稿の詳細の閲覧のみが可能。ログインするとその他様々な機能が使用可能。
## ユーザー登録画面
https://i.gyazo.com/67d96e25a02d9c0bcf61412de5d19f2d.jpg

ユーザーのログインに必要な情報及び個人の情報を記入し、登録が必要。
必須項目に記入がない場合はエラーメッセージが日本語で出力され、記入を促される。
## 投稿画面
![f33ea2453b8a4cc66c44ee91c168f265](https://user-images.githubusercontent.com/80822571/117640107-a6c91d00-b1bf-11eb-8b6d-c8934fff06fc.jpg)

ログイン状態であれば、投稿が可能。必須項目の記入（動画も含め）がないとエラーメッセージが出力され、投稿ができない。また画像の投稿もできない。投稿が完了するとトップページに遷移する。
## 投稿詳細画面・コメント機能
https://i.gyazo.com/69d61f4447f289fec671fe179547190d.jpg

投稿の詳細が閲覧可能。表示される内容は変わらないが、投稿にコメントすることが可能となる。またコメントは他者のものも閲覧可能。
## 投稿編集画面
https://i.gyazo.com/c5154525e6ef111a5468ce67bfb0431b.jpg

自身が投稿した内容の編集が可能。動画の編集は不可。
## ユーザー詳細画面
<img width="701" alt="a137a8423bec0efbe7d07bb2f364cfad" src="https://user-images.githubusercontent.com/80822571/117639615-1094f700-b1bf-11eb-8010-0f3bc2ccebf1.png">

ユーザーの詳細画面ではユーザーの詳細情報とそのユーザーの投稿が一覧となっている。またその画面からそのユーザーへDMを送信することが可能。
## ユーザー情報編集画面
https://i.gyazo.com/b1513b6f09900fff931708eeacba45f5.jpg

自身のユーザー情報の編集が可能。
## いいね一覧画面
https://i.gyazo.com/dedbf8facb342bc468af94f98524eea6.jpg

自身がいいねした投稿を全て閲覧可能。
## 検索結果画面
https://i.gyazo.com/277c53de9706a2f0c0627fba163f23d7.jpg

トップページの右下検索から楽器で検索し、検索結果の一覧投稿が閲覧可能。
## DM画面(ダイレクトメッセージ)
<img width="992" alt="75ba3d38565677dc176b52e88dd9549e" src="https://user-images.githubusercontent.com/80822571/117639577-070b8f00-b1bf-11eb-894a-904bdc79a663.png">

任意の相手とDMのやりとりが可能。
## DM相手一覧画面
https://i.gyazo.com/a1d07614786c1cb846d201b087b3e0a5.jpg

DMをやりとりしたことのあるユーザーの名前が一覧となっており、その名前を選択するとDMのルームへ遷移できる。
## フォロー・フォロワーの一覧
https://i.gyazo.com/a4ebe2f9e521661eee1577fddf02e044.jpg
https://i.gyazo.com/5073170c82f0e49dfa43cec2c97c2b3a.jpg

フォローとフォローワーを一覧で確認が可能。名前を選択するとユーザー詳細画面に遷移できる。


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

