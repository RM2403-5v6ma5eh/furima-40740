# テーブルの設計

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |

### Association
- has_many :items
- has_many :orders
- has_many :ships

## itemsテーブル
| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| product_name           | string  | null: false |
| image                  | text    | null: false |
| description            | text    | null: false |
| category_id            | integer | null: false | (ActiveHash)
| condition_id           | integer | null: false | (ActiveHash)
| burden_id              | integer | null: false | (ActiveHash)
| region_id              | integer | null: false | (ActiveHash)
| days_until_delivery_id | integer | null: false | (ActiveHash)
| price                  | string  | null: false |
| user_id                | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order 

## ordersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | references  | null: false, foreign_key: true |
| item_id            | references  | null: false, foreign_key: true |
| ship_id            | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_many :ships

## shipsテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | text    | null: false |
| prefecture_id      | integer | null: false |
| municipality       | text    | null: false |
| street_address     | text    | null: false |
| build_name         | text    |             |
| phone?num          | text    | null: false |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order

