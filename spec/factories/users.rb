require "faker"

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.street_address }
    city {Faker::Address.city}
    country {Faker::Address.country}
    password "123456"
    password_confirmation "123456"
  end
end
