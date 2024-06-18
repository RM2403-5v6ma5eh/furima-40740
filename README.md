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
- has_many :comments
- has_many :purchases
- has_many :ships

## itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product_name       | string | null: false |
| image              | text   | null: false |
| description        | text   | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| burden             | string | null: false |
| region             | string | null: false |
| days_until_delivery | string | null: false |
| price              | string | null: false |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases 
- has_many :comments 

## commentsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content            | text   | null: false |
| item               | references  | null: false, foreign_key: true |
| user               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## purchasesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_num           | text   | null: false |
| date_of_exp        | text   | null: false |
| sec_code           | text   | null: false |
| user               | references  | null: false, foreign_key: true |
| item               | references  | null: false, foreign_key: true |
| ship               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_many :ship

## shipsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | text   | null: false |
| prefecture         | text   | null: false |
| municipality       | text   | null: false |
| street_address     | text   | null: false |
| build_name         | text   |             |
| user               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase



