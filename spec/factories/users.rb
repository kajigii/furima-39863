FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.user_name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    date_of_birth         { '1996-9-22' }
  end
end
