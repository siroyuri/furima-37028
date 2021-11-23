## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items


## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| category             | integer    | null: false                    |
| status               | integer    | null: false                    |
| which_one            | integer    | null: false                    |
| prefecture           | integer    | null: false                    |
| days_id              | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## order

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| phone_number | string     | null: false                    |
| item         | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :address


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |

### Association
- has_one :order