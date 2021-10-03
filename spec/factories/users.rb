FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name            {'太郎'}
    last_name             {'佐藤'}
    first_name_kana       {'タロウ'}
    last_name_kana        {'フリマ'}
    birthday              {'1999-11-11'}
  end
end