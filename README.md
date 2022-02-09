# テーブル設計

## users テーブル

|Column|Type|Options|
|------|----|-------|
| nickname | string | null: false|
| email              | string | null: false, uniqueness:true |
| encrypted_password | string | null: false                  |
| birthday | number | null: false   |
| name_chinese | string | null:false  |
| name_katakana | string | null:false |

### Association
has_many :items, dependent: :destroy
has_many :purchases



## items テーブル

|Column|Type|Options|
|------|----|-------|
| item_name | string | null:false |
| item_text | text | null:false |
| category | string | null:false |
| status | string | null:false |
| shipping_information | string | null:false |
| shipping_area |string | null:false |
| user_id | references | null:false, foreign_key:true |

### Association
belongs_to :user
has_one :purchase, dependent: :destroy
has_one_attached :image


## purchases テーブル

|Column|Type|Options|
|------|----|-------|
| user_id | references | null:false,foreign_key:true |
| item_id | references | null:false,foreign_key:true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping, dependent: :destroy


## shippings テーブル

|Column|Type|Options|
|------|----|-------|
| post_code | number | null:false |
| prefectures | string | null:false |
| municipalities | string | null:false |
| house_number | number | null:false |
| building_name | string | |
| telephone_number | number | null:false |
| purchase_id | references | null:false,foreign_key:true |

### Association
belongs_to :purchase