FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password =            'test123'
    password_confirmation { password }
    password              { password }
    last_name_zenkaku     { '佐藤' }
    first_name_zenkaku    { '太郎' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '2022-02-22' }
  end
end