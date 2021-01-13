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
- has_many :buyers 

  
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
- has_one    :buyer 

  
##  buyers テーブル 
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
- belongs_to :item


<!-- 
| token       | string     | null: false,        |
| postal code | string     | null: false,        |
| Prefecture  | string     | null: false,        |
| City        | string     | null: false,        |
| Addresses   | string     | null: false,        |
| token       | string     | null: false,        |
|building name| string     | null: false,        |
|phone number | string     | null: false,        | -->