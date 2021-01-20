# テーブル設計

## users テーブル

| Column                 | Type    | Options                  |
| --------               | ------  | -----------              |
| nick_name              | string  | null: false              |
| email                  | string  | null: false,unique: true |
| encrypted_password     | string  | null: false              |
| family_name            | string  | null: false              |
| personal_name          | string  | null: false              |
| family_name_kana       | string  | null: false              |
| personal_name_kana     | string  | null: false              |
| barth_day              | date    | null: false              |

### Association

- has_many :items
- has_many : pay_infos


## items テーブル

| Column           | Type        | Options                           |
| --------         | ------      | -----------                       |
| user             | references  | null: false,foreign_key: true     |
| item_name        | string      | null: false                       |
| text             | text        | null: false                       |
| category _id     | integer     | null: false                       |
| state_id         | integer     | null: false                       |
| send_fee_id      | integer     | null: false                       |
| prefecture_id    | integer     | null: false                       |
| send_period_id   | integer     | null: false                       |
| price            | integer     | null: false                       |


### Association

- belongs_to :user
- has_one    :pay_info

## pay_infos テーブル

| Column        | Type        | Options                           |
| --------      | ------      | -----------                       |
| user          | references  | null: false,foreign_key: true     |
| item          | references  | null: false,foreign_key: true     |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column        | Type        | Options                          |
| -------       | ----------  | ----------------                 |
| post_cord     | string      | null: false                      |
| prefecture_id | integer     | null: false                      |
| city          | string      | null: false                      |
| street        | string      | null: false                      |
| building      | string      |                                  |
| tel_num       | string      | null: false                      |
| pay_info      | references  | null: false,foreign_key:true     |

### Association

- belongs_to :pay_info