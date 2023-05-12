## Tabel名

## users  テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| user_name           | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many  :product_information
- has_many  :purchase_records

## product_information  テーブル

| Column            | Type        | Options     |
| ----------------- | ----------- | ----------- |
| name              | string      | null: false |
| description       | text        | null: false |
| category_id       | integer     | null: false |
| condition_id      | integer     | null: false |
| shipping_cost_id  | integer     | null: false |
| shipping_area_id  | integer     | null: false |
| price             | integer     | null: false |
| user              | references  | null: false,foreign_key: true |
| days_to_ship_id   | integer     | null: false |

### Association

- belongs_to :users
- has_one    :purchase_records

## purchase_records  テーブル

| Column              | Type     | Options                        |
| ------------------  | -------- | ------------------------------ |
| purchaser           | string   | null: false, foreign_key: true |
| products_purchased  | string   | null: false, foreign_key: true |
| deliver_status      | string   | null: false |
| days_of_purchase    | datetime | null: false |

### Association

- belongs_to  :users
- belongs_to  :product_information
- has_one     :shipping_address

## shipping_address  テーブル

| Column          | Type    | Options                        |
| --------------  | ------- | ------------------------------ |
| postal_code     | string  | null: false |
| prefecture_id   | integer | null: false |
| city            | string  | null: false |
| block_number    | string  | null: false |
| apartment_name  | string  |             |
| phone_number    | string  | null: false |

### Association

- belongs_to :purchase_records