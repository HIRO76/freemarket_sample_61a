# README

# mercariclone
http://52.194.135.25/<br>
admin: admin<br>
パスワード: 43543

# 概要
チームによるアジャイル開発で作成したメルカリのクローンサイト<br>
<a href="https://docs.google.com/document/d/132-cMrTt1R8q_F_JjciesF5yyKcMQK13s6Eqg9MIy7Q/edit#heading=h.uc9r1bu1xm1f" target="new">詳細</a>

# 技術・環境
- ruby 2.5.1
- Rails 5.2.3
- carrierwave（画像アップロード）
- ransack（検索機能）
- devise（認証）
- omniauth（認証）
- payjp（購入）
- ancestry（カテゴリー管理）
- unicorn（デプロイ）
- AWS（デプロイ）


# mercari  DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana|string|null: false|
|first_kana|string|null: false|
|birthday|date|null: false|
|postal_code|string|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false, unique: true|
|profile|text||
|image|string|default: ""|
|email|string|default: "", index: true, unique: true|
|encrypted_password|string|null: false|
|reset_password_token|string|index: true|

### Association
- has_many :items
- has_many :purchaces
- has_many :cards
- has_one  :private_information
 
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key:true|

### Association
- belongs_to :item
 
 
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|description|string|null: false|
|title|string||null: false|null: false|
|category|references|null: false, foreign_key: true|
|status|integer|null: false|
|shipping_charge|integer|null: false|
|delivery_source|integer|null: false|
|shipping_day|integer|null: false|
|shipping_method|integer|null: false|
|dealing|integer|null: false default: 0|
|user|references|null: false, foreign_key: true|
|brand|string||
 
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :comments
- has_many :images
 
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string||null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
 
 
## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user
 
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text||
|ancestry|string|index: true|

### Association
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## private_informationsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_kana|string|null: false|
|first_kana|string|null: false|
|birthday|date|null: false|
|postal_code|string||
|prefectures|integer||
|city|string||
|house_number|string||
|building_name|string||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
