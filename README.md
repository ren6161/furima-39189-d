## Tabel名

## users  テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| user_name           | string | null: false |
| email               | string | null: false,unique: true |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many  :items
- has_many  :orders

## items  テーブル

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

- belongs_to :user
- has_one    :orders

## orders テーブル

| Column              | Type       | Options                       |
| ------------------  | --------   | ----------------------------- |
| user                | references | null: false,foreign_key: true |
| item                | references | null: false,foreign_key: true |
### Association

- belongs_to  :user
- belongs_to  :items
- has_one     :shipping_address

## shipping_addresses  テーブル

| Column          | Type    | Options                        |
| --------------  | ------- | ------------------------------ |
| postal_code     | string  | null: false |
| shipping_area_id | integer | null: false |
| city            | string  | null: false |
| block_number    | string  | null: false |
| apartment_name  | string  |             |
| phone_number    | string  | null: false |
| orders          | references | null: false,foreign_key: true |

### Association

- belongs_to :order