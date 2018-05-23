50.times do
  Category.create!(
    name: Faker::Name.name
    )
end

50.times do
  category_ids = Category.all.pluck(:id)
  name = Faker::Name.title
  description = Faker::Lorem.sentence(5)
  image = "rails.png"
  price = Faker::Number.number(2)
  quantity = Faker::Number.between(1, 10)
  Product.create!(
      category_id: category_ids[rand(category_ids.size)],
      name: Faker::Name.name,
      description: description,
      price: price,
      image: image,
      quantity: quantity
    )
end
