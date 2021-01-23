FactoryBot.define do
  factory :item do
    name                  { 'test' }
    information           { 'てすと' }
    category_id           { 1 }
    sales_status_id       { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id         { 1 }
    scheduled_delivery_id { 1 }
    price                 { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/heroのコピー.jpg'), filename: 'test_image.png')
    end
  end
end
