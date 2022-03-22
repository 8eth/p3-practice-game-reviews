puts "Clearing data..."
User.destroy_all
Game.destroy_all
Category.destroy_all
Review.destroy_all

Faker::Game.unique.clear

puts "Creating users..."
10.times do
    User.create(username: Faker::Internet.username, email: Faker::Internet.email)
end

puts "Creating categories..."
categories = ["First-person shooter", "Puzzle", "Platformer", "RPG", "MMO", "Adventure"]
categories.each do |category|
    Category.create(name: category)
end

puts "Creating games..."
10.times do 
    Game.create(name: Faker::Game.unique.title, platform: Faker::Game.platform, category: Category.all.sample)
end

# TODO: Create seeds for the models/migrations you have added
puts "Creating reviews..."
20.times do
    Review.create(content: Faker::Verb.ing_form, rating: Faker::Number.between(from: 1, to: 5), user: User.all.sample, game: Game.all.sample)
end

puts "Database seeded successfully!"