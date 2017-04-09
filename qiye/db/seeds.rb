# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.strategy = :truncation, {:only => [:products, :categories]}
DatabaseCleaner.clean


1.upto(4).each do |i|
  category = Category.create(name: "category #{i}", logo: "/images/#{i}.jpg")

  1.upto(4).each do |j|
    product = category.products.create(name: "product #{j}", logo: "/images/#{i + j}.jpg")
  end
end