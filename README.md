# README 
  
## users テーブル 

| Column   | Type               | Options     | 
| -------- | ------             | ----------- | 
| nickname             | string | null: false | 
| email                | string | null: false | 
| password confirmation| string | null: false | 
| first_name           | string | null: false |            
| last_name            | string | null: false |             
| first_name kana      | string | null: false | 
| last_name kana       | string | null: false | 
| birth_date           |  date  | null: false |            

### Association 

- has_many :items 
- has_many :shipping address

  
## items テーブル  

| Column     | Type                    | Options           | 
| ------     | ----------              | ------------      | 
| image      | foreign_key: true       | null: false,      | 
| name                     | string    | null: false,      | 
| information              | text      | null: false,      | 
| category_id              | integer   | null: false,      |      
| sales_status_id          | integer   | null: false,      | 
| shipping_fee_status_id   | integer   | null: false       | 
| prefecture_id            | integer   | null: false       | 
| scheduled_delivery_id    | integer   | null: false       | 
| price                    | integer   | null: false,      | 

| users  | references | null: false, foreign_key: true | 


### Association 

- belongs_to :user 
- has_one    :shipping address 
- has_one    :purchase 

  
##  shipping address テーブル 
| Column         | Type       | Options             | 
| ------         | ---------- | ------------        | 
| postal_code    | string     | null: false,        | 
| prefecture     | string     | null: false,        | 
| city           | string     | null: false,        | 
| address        | string     | null: false,        | 
| phone_number   | string     | null: false,        | 
| building_name  | string     |                     |
 
| users  | references | null: false, foreign_key: true | 
| items  | references | null: false, foreign_key: true | 


### Association 

- belongs_to :user 
- has_one    :item


##  purchase テーブル
| Column         | Type       | Options             | 
| ------         | ---------- | ------------        | 
|  user          | references | foreign_key: true   | 
|  item          | references | foreign_key: true   | 

- has_one    :item
- has_one    :user