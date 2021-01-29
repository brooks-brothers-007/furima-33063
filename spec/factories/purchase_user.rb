FactoryBot.define do
  factory :purchase_user do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '123-4567' }
    prefecture_id  { 1 }
    city           { '渋谷' }
    address        { '1-1' }
    phone_number   { '09012345678' }
  end
end
