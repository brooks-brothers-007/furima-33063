# README

## users テーブル

| Column   | Type   | Options                 |
| -------- | ------ | -----------             |
| nickname | string | null: false             |
| email    | string | null: false             |
| password | string | null: false             |
| password confirmation | string | null: false|
|first name| string | null: false             |
|last name | string | null: false             |
| first name kana       | string | null: false|  
|  last name kana       | string | null: false|  
|birth date| string |              null: false|
 ### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column     | Type       | Options             |
| ------     | ---------- | ------------        |
| image      | foreign_key: true | null: false, |
| name       | string     | null: false,        |
|information | text       | null: false,        |
|  category  |            | null: false,        |     
|sales status|            | null: false,        |
| shipping fee status |   | null: false         |
| prefecture  |           | null: false         |
| scheduled delivery |    | null: false         |
| price      |            | null: false,        |
| price half | string     | null: false,        |
| price out  | string     | null: false,        |
| user       |references  | foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :buyer

##  buyers テーブル

| Token | string     | null: false,        |
| Postal code  | string     | null: false,        |
| Prefecture  | string     | null: false,        |
| City | string     | null: false,        |
| Addresses  | string     | null: false,        |
| token  | string     | null: false,        |
| prefecture  | string     | null: false,        |
| phone number | string     | null: false,        |