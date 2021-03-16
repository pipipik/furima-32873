# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type       | Options           |
| ----------------------- | ---------- | ----------------- |
| item_name               | string     | null: false       |
| item_info               | text       | null: false       |
| item_category           | string     | null: false       |
| item_status             | string     | null: false       |
| item-shipping-fee       | string     | null: false       |
| item_prefecture         | string     | null: false       |
| item_scheduled_delivery | string     | null: false       |
| item_price              | string     | null: false       |
| user_id                 | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options       |
| ------- | ---------- | ------------- |
| user_id | references | foreign: true |
| item_id | references | foreign: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| post_code    | string | null: false |
| prefecture   | string | null: false |
| city         | string | null: false |
| address      | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :order


