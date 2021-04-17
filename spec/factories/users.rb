FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    instrument { 'ギター' }
    age { 29 }
    genre { 'J-POP' }
    artist { 'スキマスイッチ' }
    prefecture_id {2}
    history_id {2}
    gender_id {2}
  end
end