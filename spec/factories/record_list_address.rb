FactoryBot.define do
  factory :record_list_address do
    postcode     { '123-4567' }
    ship_form_id { 3 }
    city         { '大阪' }
    street       { '青山1-1-1' }
    building     { 'ハイツ' }
    phone_number { '01012345678' }
    token        {"tok_abcdefghijk00000000000000000"}
  end
end