FactoryBot.define do
  factory :user do
    nickname              {'test'}
    first_name            {'太郎'}
    last_name             {'佐藤'}
    first_name_KANA       {'タロウ'}
    last_name_KANA        {'フリマ'}
    birthday              {'1999-11-11'}
  end
end