# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create a County first (if necessary)
County.create(name: 'Your County Name')

# Create users
User.create(
  email: 'user1@example.com',
  full_name: 'John Doe',
  national_id: '1234567890',
  gender: 'male',  # Ensure lowercase
  contact: '1234567890',
  # Add other user attributes here
)

# Create more users if needed...
