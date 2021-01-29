FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { '00test' }
    password_confirmation { password }
    first_name            { 'てすと' }
    last_name             { 'てすと' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birth_date            { '20210101' }
  end
end
