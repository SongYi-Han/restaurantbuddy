# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  new = Restaurant.new(name: Faker::Coffee.blend_name, address: Faker::Address.street_address )
  new.save
  3.times do
    review = Review.new(content: Faker::FamousLastWords.last_words)
    review.restaurant = new
    review.save
  end
end
