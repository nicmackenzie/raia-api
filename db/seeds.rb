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

puts "Seeding database..."
user1 = User.create(full_name:"John",national_id:"54536533",gender:"Male",date_of_birth:"18-04-1997",interests:"Better county for us all",occupation:"Doctor",contact:"0745362790",location:"Home",county_id:2,ward:"Mlolongo",role:0,password:"1234",elected_position:"none",profile_image:"https://images.unsplash.com",verified:false,active:true,is_deleted:false,email:"john@gmail.com")
# user2 = User.create(full_name:"Jack",email:"jack@gmail.com")
# user3 = User.create(full_name:"Eustus",email:"eustus@gmail.com")
# discussion1 = Discussion.create(title:"Climate change",content:"The weather patterns recently have drastically changed",user_id:1,is_deleted:false)
# discussion2 = Discussion.create(title:"Roads status",content:"The roads built about 10 years back are in very poor condition at the moment",user_id:2,is_deleted:false)
# discussion3 = Discussion.create(title:"Networking opportunities",content:"there are very few networking seminars for the youth",user_id:3,is_deleted:false)
# discussion_rep = DiscussionReply.create(discussion_id:1,user_id:1,content:"Yes i agree for example in Rongai it has been extremely cold the past week which is very rare",upvotes:2)
# discussion_rep2 = DiscussionReply.create(discussion_id:2,user_id:2,content:"For my case i cant even see a tarmac road anymore its all dust",upvotes:3)
# # discussion_rep3 = DiscussionReply.create(discussion_id:3,user_id:3,content:"I am seeking individuals who are as into tech as I am but it is proving difficult",upvotes:2)

# review1 = Review.create(content:"could do better in terms of engagement with citizens",rating:3.5,user_id:2)
# review1 = Review.create(content:"Really seen a significant improvement",rating:4.5,user_id:3)
# review1 = Review.create(content:"No dedication whatsoever to their work",rating:1.5,user_id:1)

puts "Done seeding"if County.all.length == 0
    puts "Seeding counties...."
    County.create([{ name: 'Mombasa' },{ name: 'Kwale' },{ name: 'Kilifi' },{ name: 'Tana River' },{ name: 'Lamu' },
    { name: 'Taita-Taveta' },{ name: 'Garissa' },{ name: 'Wajir' },{ name: 'Mandera' },{ name: 'Marsabit' },
    { name: 'Isiolo' },{ name: 'Meru' },{ name: 'Tharaka-Nithi' },{ name: 'Embu' },{ name: 'Kitui' },
    { name: 'Machakos' },{ name: 'Makueni' },{ name: 'Nyandarua' },{ name: 'Nyeri' },{ name: 'Kirinyaga' },
    { name: 'Murang\'a' },{ name: 'Kiambu' },{ name: 'Turkana' },{ name: 'West Pokot' },{ name: 'Samburu' },
    { name: 'Trans-Nzoia' },{ name: 'Uasin Gishu' },{ name: 'Elgeyo-Marakwet' },{ name: 'Nandi' },
    { name: 'Baringo' },{ name: 'Laikipia' },{ name: 'Nakuru' },{ name: 'Narok' },{ name: 'Kajiado' },
    { name: 'Kericho' },{ name: 'Bomet' },{ name: 'Kakamega' },{ name: 'Vihiga' },{ name: 'Bungoma' },
    { name: 'Busia' },{ name: 'Siaya' },{ name: 'Kisumu' },{ name: 'Homa Bay' },{ name: 'Migori' },
    { name: 'Kisii' },{ name: 'Nyamira' },{ name: 'Nairobi' }])
    puts "Counties seeded!"
# Add this line at the top of your seeds.rb file


# ... rest of the code ...

# Create some counties
# 5.times do
#   County.create(name: Faker::Address.unique.county)
# end

# Create some users
# 5.times do
#   User.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email)
# end

# Create some events
# 10.times do
#   Event.create(
#     name: Faker::Lorem.sentence,
#     description: Faker::Lorem.paragraph,
#     date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
#     county_id: County.pluck(:id).sample,
#     user_id: User.pluck(:id).sample
#   )
# end
# event1 = Event.create(name:"Graduation",description:"Our leaders trainees are graduating",date:'14-10-2023',county_id:1,user_id:1)
# event2 = Event.create(name:"signing in of governor",description:"The governor of our county is getting sweared into office",date:'15-10-2023',county_id:2,user_id:2)
# event3= Event.create(name:"Leaders Summit",description:"All the leaders of our great county are meeting to discuss issues",date:'16-10-2023',county_id:3,user_id:2)
# event4 = Event.create(name:"Baraza",description:"You the citizens can come to city hall and air your grievances",date:'17-10-2023',county_id:3,user_id:1)

