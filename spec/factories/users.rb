require "faker"

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email "VUONGKYKHAN@GMAIL.COM"
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.street_address }
    city "ffff"
    country "dhvfjdhg"
    password "123456"
    password_confirmation "123456"
  end
end
