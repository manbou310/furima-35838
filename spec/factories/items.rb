FactoryBot.define do
  factory :item do
    item_name            {'test'}
    description          {'test'}
    category_id          {3}
    status_id            {3}
    shopping_charge_id   {3}
    ship_form_id         {3}
    delivery_time_id     {3}
    price                {1000}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
