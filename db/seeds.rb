User.create!(
  name: "Vuong Ky Khan",
  email: "vuongkykhan@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  phone: "0123456789",
  address: "964/30B Lo Gom, Ward 8, District 6",
  city: "HoChiMinh",
  country: "VietNam",
  role: 0
  )

User.create!(
  name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  phone: "0123456789",
  address: "964/30B Lo Gom, Ward 8, District 6",
  city: "HoChiMinh",
  country: "VietNam",
  role: 0
  )

5.times do
  Category.create!(
    name: Faker::Name.name
    )
end

50.times do
  category_ids = Category.all.pluck(:id)
  name = Faker::Name.title
  description = Faker::Lorem.sentence(5)
  price = Faker::Number.number(2)
  quantity = Faker::Number.between(1, 10)
  Product.create!(
      category_id: category_ids[rand(category_ids.size)],
      name: Faker::Name.name,
      description: description,
      price: price,
      image: Rails.root.join("public/uploads/product/image/51/shoes.jpg").open,
      quantity: quantity
    )
end
