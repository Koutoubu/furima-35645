FactoryBot.define do
  factory :shared_address do
    postal_number  { '111-1111' }
    area_id        { Faker::Number.between(from: 2, to: 48) }
    municipalities { '佐藤' }
    address        { '1111-111' }
    building       { Faker::Lorem.word }
    tell_number    { '09011111111' }
    token          { "tok_aaaaaaaaaaa00000000000000000" }
    association :user
    association :item
  end
end