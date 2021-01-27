class PurchaseUser

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: " Input correctly" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: " Input only number" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }  

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number )
  end  

end  