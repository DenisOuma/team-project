# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'sseeding'
users = [
    {username: "Phill", email:"ochiengphillip84@gmail.com"},
    {username: "Spiderman", email:"peterpaka@gmail.com"},
    {username: "Batman", email:"brucebatz@gmail.com"}
]
puts "creating users...."
users.each {|user| User.create(user)}
puts 'Done!'