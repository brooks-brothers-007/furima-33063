FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    first_name            {"test"}
    last_name             {"test"}
    first_name_kana       {"test"}
    last_name_kana        {"test"}
    birth_date            {"20210101"}
  end
end    