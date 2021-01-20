class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :user 
  
  with_options presence: true do
    validates :image                  
    validates :name                   
    validates :information
    validates :price
    with_options numericality: { other_than: 50 } do        
      validates :category_id            
      validates :sales_status_id        
      validates :shipping_fee_status_id 
      validates :prefecture_id          
      validates :scheduled_delivery_id  
    end                   
  end
end