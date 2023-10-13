FactoryBot.define do
  factory :purchase_address do
    post_code         { '123-4567' }
    region_id         { 2 }
    city              { 'さいたま市桜区' }
    street_address    { '西堀1-1-1' }
    building          { '東京ハイツ' }
    telephone_number  { '09012345678' }
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
