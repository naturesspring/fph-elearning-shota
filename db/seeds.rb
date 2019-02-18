# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
    User.create(
        name: Faker::JapaneseMedia::OnePiece.character,
        email: "rails#{n+1}@email.com",
        password: "password"
    )
end
50.times do |n|
    Category.create(
        title: Faker::Company.name,
        description: Faker::Football.player
    )
end
