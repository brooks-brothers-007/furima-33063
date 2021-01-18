FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    first_name            {"ＴＥＳＴ"}
    last_name             {"ＴＥＳＴ"}
    first_name_kana       {"テスト"}
    last_name_kana        {"テスト"}
    birth_date            {"20210101"}
  end
end    