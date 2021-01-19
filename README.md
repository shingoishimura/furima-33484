# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| nick_name     | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| family_name   | string  | null: false |
| personal_name | string  | null: false |
| barth_day     | integer | null: false |

### Association

- has_many :items

## items テーブル

| Column        | Type        | Options                           |
| --------      | ------      | -----------                       |
| user          | references  | null: false,foreign_key: true     |
| item_name     | string      | null: false                       |
| category      | string      | null: false                       |
| state         | string      | null: false                       |
| send_fee      | string      | null: false                       |
| prefecture    | string      | null: false                       |
| send_period   | string      | null: false                       |
| price         | integer     | null: false                       |


### Association

- belongs_to :user
- has_one :pay_info

## pay_infos テーブル

| Column        | Type        | Options                           |
| --------      | ------      | -----------                       |
| items         | references  | null: false,foreign_key: true     |
| credit_num    | integer     | null: false                       |
| e_date_m      | integer     | null: false                       |
| e_date_y      | integer     | null: false                       |
| s_cord        | integer     | null: false                       |
| prefecture    | string      | null: false                       |
| send_period   | string      | null: false                       |
| price         | integer     | null: false                       |

### Association

- belongs_to :items
- has_one    :addresses

## addresses テーブル

| Column        | Type        | Options         |
| -------       | ----------  | ----------------|
| post_cord     | integer     | null: false     |
| prefecture    | string      | null: false     |
| city          | string      | null: false     |
| street        | string      | null: false     |
| building      | string      | null: true      |
| tel_num       | integer     | null: false     |


### Association

- belongs_to :room