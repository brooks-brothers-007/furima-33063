class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user 
  
  with_options presence: true do
    validates :image                  
    validates :name                   
    validates :information
    validates :price
  end  
  with_options presence: true, numericality: {other_than: 0, message:"Select"} do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id 
      validates :prefecture_id          
      validates :scheduled_delivery_id  
  end
  validates :price, numericality:{with: /\A[0-9]*\z/, message: "Half-width number"}
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end

