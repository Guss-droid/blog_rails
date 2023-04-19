# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding development database...'
gustavo = User.first_or_create!(
  email: 'gustavo@gmail.com',
  first_name: 'Gustavo',
  last_name: 'Ré',
  password: '123456',
  password_confirmation: '123456',
  role: User.roles[:admin]
)

john = User.first_or_create!(
  email: 'john@doe.com',
  first_name: 'John',
  last_name: 'Doe',
  password: '123456',
  password_confirmation: '123456'
)

Address.first_or_create!(
  street: 'Oranges',
  city: 'Jundiaí',
  state: 'São Paulo',
  zip: '1234',
  country: 'BR',
  user: gustavo
)

Address.first_or_create!(
  street: 'Cherrys',
  city: 'TownsVille',
  state: 'CA',
  zip: '12345',
  country: 'BR',
  user: john
)

elapsed = Benchmark.measure do
  posts = []

  10.times do |x|
    post = Post.new(title: "Title #{x}", body: "this is #{x} body here!", user: gustavo)

    5.times do |y|
      post.comments.build(body: "This is my #{y} comment", user: john)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"
