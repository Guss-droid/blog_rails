# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
  email: 'gustavo@gmail.com',
  name: 'Gustavo',
  password: '123456',
  password_confirmation: '123456',
  role: User.roles[:admin]
)

User.create(
  email: 'john@doe.com',
  name: 'John',
  password: '123456',
  password_confirmation: '123456'
)

10.times do |x|
  post = Post.create(title: "Title #{x}", body: "this is #{x} body here!", user_id: User.first.id)

  2.times do |y|
    Comment.create(body: "This is my #{y} comment", user_id: User.second.id, post_id: post.id)
  end
end
