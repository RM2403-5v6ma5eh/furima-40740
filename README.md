# テーブルの設計

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | data   | null: false |

### Association
- has_many :items
- has_many :orders
- has_many :ships

## itemsテーブル
| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| product_name           | string  | null: false |
| description            | text    | null: false |
| category_id            | integer | null: false | (ActiveHash)
| condition_id           | integer | null: false | (ActiveHash)
| burden_id              | integer | null: false | (ActiveHash)
| region_id              | integer | null: false | (ActiveHash)
| days_until_delivery_id | integer | null: false | (ActiveHash)
| price                  | integer | null: false |
| user                   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order 

## ordersテーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :ship

## shipsテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | strings | null: false |
| prefecture         | integer | null: false |
| municipality       | strings | null: false |
| street_address     | strings | null: false |
| build_name         | strings |             |
| phone_num          | strings | null: false |
| user               | references | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

