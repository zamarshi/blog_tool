# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
 Tag.create(name: Faker::Music.instrument)
end

tags = Tag.all

20.times do
 User.create({first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password })
end

100.times do
 Post.create({title: Faker::Company.catch_phrase,
                body: Faker::Hacker.say_something_smart,
                category_id: rand(1..7),
                user_id: rand(1..15),
                tags: tags.sample(rand(3) + 1)
                })
end
