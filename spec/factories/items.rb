FactoryBot.define do
  factory :item do
    item_name         { Faker::Lorem.sentence[0..39] }  # 最長40文字までのランダムなテキスト
    description       { Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 5) }  # 1000文字までのランダムなパラグラフ
    category_id       { 2 }
    condition_id      { 2 }
    burden_id         { 2 }
    region_id         { 2 }
    until_shipping_id { 2 }
    price             { Faker::Number.between(from: 300, to: 10000000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end


