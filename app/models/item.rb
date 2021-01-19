class Item < ApplicationRecord
  has_one_attached :image
  belongs_to       :user 
  has_one          :purchase 

  validates :image, :name, :information, :category_id, :sales_status_id, :shipping_fee_status_id
            , :prefecture_id, :scheduled_delivery_id, :price, presence: true
end
