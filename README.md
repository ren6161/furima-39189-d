<!-- ## Tabel名

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string | null: false |
| Email_address      | string | null: false |
| password           | string | null: false |
| confirm_password   | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :product_information
- has_many :purchase_records
- has_one  :shipping_address

## product_information テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ----------- |
| name          | string  | null: false |
| description   | text    | null: false |
| category      | string  | null: false |
| condition     | string  | null: false |
| shipping_cost | string  | null: false |
| shipping_area | string  | null: false |
| price         | integer | null: false |
| exhibitor     | string  | null: false,foreign_key: true |
| days_to_ship  | string  | null: false |

### Association

- has_one :users
- has_one :purchase_records
- has_one :shipping_address

## purchase_records テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| purchaser          | string   | null: false, foreign_key: true |
| products_purchased | string   | null: false, foreign_key: true |
| deliver_status     | string   | null: false |
| days_of_purchase   | datetime | null: false |

### Association

- has_one :users
- has_one :product_information
- has_one :shipping_address

## shipping_address テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | integer | null: false |
| prefecture     | string  | null: false |
| city           | string  | null: false |
| block_number   | string  | null: false |
| apartment_name | string  | unique: true |
| phone_number   | integer | null: false |

### Association

- has_one :users
- has_one :product_information
- has_one :purchase_records -->