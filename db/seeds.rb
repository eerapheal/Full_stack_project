# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
  # User.create(name: "Ralph03", email: "charle@gmail.com", password: "power003")
  # User.create(name: "Hasina", email: "charls@gmail.com", password: "power003")
  # User.create(name: "James", email: "charley@gmail.com", password: "power003")
 first_user = User.create([{ name: "milbert"}, { email: "charles@gmail.com"}, { encrypted_password: "power003"}])
  # User.create(name: "Bob")
  Motorcycle.create(name: "Ralph", image: "http://", description: "Ralph", motorcycle_type:"JO")
