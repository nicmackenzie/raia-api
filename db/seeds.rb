# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding database..."
# user1 = User.create(name:"John",role:"Doctor")
# user2 = User.create(name:"Jack",role:"Chief")
# user3 = User.create(name:"Eustus",role:"Developer")
discussion1 = Discussion.create(title:"Climate change",content:"The weather patterns recently have drastically changed",user_id:1,is_deleted:false)
discussion2 = Discussion.create(title:"Roads status",content:"The roads built about 10 years back are in very poor condition at the moment",user_id:2,is_deleted:false)
discussion3 = Discussion.create(title:"Networking opportunities",content:"there are very few networking seminars for the youth",user_id:3,is_deleted:false)
puts "Done seeding"